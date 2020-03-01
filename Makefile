BASE_PATH = $(shell pwd)
PROCESSORS_COUNT = $(shell cat /proc/cpuinfo | grep processor | wc -l)

help:
	@printf "Usage : TODO\n"

build:
	rm -rf $(BASE_PATH)/Build
	mkdir $(BASE_PATH)/Build
	cd $(BASE_PATH)/Build && cmake $(BASE_PATH)/minetest -DRUN_IN_PLACE=TRUE
	cd $(BASE_PATH)/Build && make -j $(PROCESSORS_COUNT)

install:
	@printf "\033[33mGetting Minetest engine sources...\033[0m\n"
	git clone https://github.com/minetest/minetest
	@printf "\033[33mGetting Minetest game sources...\033[0m\n"
	git clone https://github.com/minetest/minetest_game $(BASE_PATH)/minetest/games/minetest_game
	@printf "\033[33mGetting mobs mod base sources...\033[0m\n"
	git clone https://notabug.org/TenPlus1/mobs_redo $(BASE_PATH)/minetest/mods/mobs_redo
	@printf "\033[33mGetting animals mod sources...\033[0m\n"
	git clone https://notabug.org/TenPlus1/mobs_animal $(BASE_PATH)/minetest/mods/mobs_animal
	@printf "\033[33mGetting horses mod sources...\033[0m\n"
	git clone https://notabug.org/TenPlus1/mob_horse $(BASE_PATH)/minetest/mods/mob_horse
	@printf "\033[33mGetting monsters mod sources...\033[0m\n"
	git clone https://notabug.org/TenPlus1/mobs_monster $(BASE_PATH)/minetest/mods/mobs_monster
	@printf "\033[33mGetting NPC mod sources...\033[0m\n"
	git clone https://notabug.org/TenPlus1/mobs_npc $(BASE_PATH)/minetest/mods/mobs_npc
