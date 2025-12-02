struct process *min_affinity(struct core *c) {
	struct process *cp = c->process;
	struct heap *h = cp->h;
	int cid = atomic_load(&cp->cid);
	if (cid != c->cid) {
		return NULL;
	}
	if(atomic_load(&h->heap[0].elem) != cp) {
		return NULL;
	}
	struct process *p = NULL;
	lock_acquire(&h->lk);
	if((h->heap[0].elem != cp) || (cp->cid != c->cid)) {
		goto end;
	}
retry:
	vt_t vt;
	int j = mh_rand_heap(cp->mh, c, h->id);
	struct heap *h1 = select_affinity(h->id, j, &vt);
	if (h1 == h) {
		p = remove_min(h);
		goto end;
	}
	int l = lock_try_acquire(&h1->lk);
	if (l != 0) {
		goto retry;
	}
	vt_t vt0 = h1->heap[0].vruntime;
	if (vt != vt0) {
		lock_release(&h1->lk);
		goto retry;
	}	
	p = remove_min(h1);
	lock_release(&h1->lk);
end:
	lock_release(&h->lk);
	return p;
}
