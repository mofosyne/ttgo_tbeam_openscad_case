# match "module foobar() { // `make` me"
TARGETS= part_ttgo_20191212_t22_V1_1_case_ipex_top.stl \
part_ttgo_20191212_t22_V1_1_case_ipex_bottom.stl \
part_ttgo_20191212_t22_V1_1_case_sma_top.stl \
part_ttgo_20191212_t22_V1_1_case_sma_bottom.stl \

all: ${TARGETS}

# auto-generated .scad files with .deps make make re-build always. keeping the
# scad files solves this problem. (explanations are welcome.)
.SECONDARY: $(shell echo "${TARGETS}" | sed 's/\.stl/.scad/g')

# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

%.scad:
	echo "use <ttgo_20191212_t22_V1_1_case.scad>\n$*();" > $@

%.stl: %.scad
	openscad -m make -o ./stl/$@ -d $@.deps $<
 
clean:
	rm part_*