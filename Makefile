all: doc

avg_times: data/g38/all_times
	./comp_avg_times data/g38
	./comp_avg_times data/g37-1
	./comp_avg_times data/g37-2

fig: data/g38/all_times avg_times
	[[ -d ./fig ]] || mkdir -p ./fig
	gnuplot ./create_figs.gnu

doc: fig
	latexmk
