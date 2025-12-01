// Select next process to run
struct process *gh_schedule(struct global_heap *gh, struct core *c) {
	struct process *min_proc = NULL;
	if(do_affinity && gh->mh->nheap > 1 && c->process) {
		min_proc = mh_min_affinity(c);
	}
	if (min_proc == NULL) {
		min_proc = mh_min_proc(gh->mh, c);
	}
	if (min_proc == NULL) {
		return NULL;
	}
	return min_proc;
}
