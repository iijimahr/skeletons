###
### Task runner of visualization
###

FIG_DIR = fig
SCRIPTS = $(wildcard plot_*.py)
IMAGES = $(addprefix $(FIG_DIR)/, $(SCRIPTS:.py=.png))

.PHONY: all
all:
	@make image

.PHONY: image
image: $(IMAGES)

.PHONY: clean
clean:
	rm -rf fig __pycache__

$(FIG_DIR)/%.png: %.py
	python $<
