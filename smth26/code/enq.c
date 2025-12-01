vt_t calc_delta(vt_t delta, w_t weight) {
        return delta / weight;
}

void enq_proc_vt(struct global_heap *gh, struct core *c, struct process *p, struct heap *h) {
	vt_t wvt = calc_delta(gh->tick_length, p->he.weight);
	vt_t my_vt = atomic_fetch_add(&p->group->vruntime, vt);
	p->he.vruntime = my_vt;
	mh_add_process(c, p, h);
}
