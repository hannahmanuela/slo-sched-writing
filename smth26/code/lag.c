void set_vruntime(struct process *p) {
	vt_t lag = p->group->vruntime - p->group->min_vt_deq;
	vt_t h_min = mh_min_vt(h);
	if(p->group->min_vt_deq > h_min) {
		lag += (p->group->min_vt_deq-h_min);
	}
	atomic_store(&p->group->vruntime, h_min+lag);
}
