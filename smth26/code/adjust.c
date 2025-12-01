void grp_adjust_vruntime(struct global_heap *gh, struct process *p, t_t time_passed) {
	vt_t vt = calc_delta(time_passed, p->he.weight);
	vt_t wvt = calc_delta(gh->tick_length, p->he.weight);
	if (wvt > vt) {
		atomic_fetch_add(&p->group->vruntime, -(wvt-vt));
	}
}
