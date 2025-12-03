void adjust_vruntime(struct process *p, t_t time_passed) {
	vt_t vt = calc_delta(time_passed, p->group->weight);
	vt_t wvt = calc_delta(TICK_LENGTH, p->group->weight);
	if (wvt > vt) {
		atomic_fetch_add(&p->group->vruntime, -(wvt-vt));
	}
}
