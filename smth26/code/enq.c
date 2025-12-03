vt_t calc_delta(vt_t delta, w_t weight) {
        return delta / weight;
}

void enq_proc_vt(struct process *p, struct heap *h) {
	vt_t wvt = calc_delta(TICK_LENGTH, p->group->weight);
	vt_t my_vt = atomic_fetch_add(&p->group->vruntime, vt);
	p->vruntime = my_vt;
	add_process(p, h);
}
