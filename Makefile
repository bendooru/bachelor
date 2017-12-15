all: doc

avg_times: data/all_times
	./comp_avg_times

fig: data/all_times avg_times
	[[ -d ./fig ]] || mkdir -p ./fig
	gnuplot ./create_g38_scaling.gnu

doc: fig
	latexmk
