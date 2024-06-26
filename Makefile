BASE_PATH = $(shell pwd)
PROCESSORS_COUNT = $(shell cat /proc/cpuinfo | grep processor | wc -l)

help:
	@printf "Available rules :\n"
	@printf "   download : retrieve all needed source files\n"
	@printf "   build : build everything to run in place, start minetest/bin/minetest to run the game\n"
	@printf "   update: update all sources to latest version\n"
	@printf "   clean : remove everything\n"
	@printf "\n"
	@printf "First usage should be : make clean && make download && make build\n"
	@printf "Following usages should be : make update && make build\n"
	@printf "\n"
	@printf "\033[32mWhen build has succeeded, execute this command to play the game :\033[0m $(BASE_PATH)/minetest/bin/minetest\n"

build:
	mkdir -p $(BASE_PATH)/Build
	cd $(BASE_PATH)/Build && cmake $(BASE_PATH)/minetest -DRUN_IN_PLACE=TRUE
	cd $(BASE_PATH)/Build && make -j $(PROCESSORS_COUNT)

clean:
	rm -rf $(BASE_PATH)/Build
	@$(eval WORLDS_BACKUP_NAME = $(BASE_PATH)/worlds-$(shell date "+%4Y-%m-%d_%H-%M-%S").bak)
	@if [ -e $(BASE_PATH)/minetest/worlds ]; \
	then \
		printf "\033[33mSaving existing worlds to $(WORLDS_BACKUP_NAME)...\033[0m\n"; \
		mv $(BASE_PATH)/minetest/worlds $(WORLDS_BACKUP_NAME); \
	fi
	rm -rf $(BASE_PATH)/minetest

download:
	@printf "\033[33mGetting Minetest engine sources...\033[0m\n"
	git clone https://github.com/minetest/minetest
	git clone https://github.com/minetest/irrlicht minetest/lib/irrlichtmt
	@printf "\033[33mGetting Minetest game sources...\033[0m\n"
	git clone https://github.com/minetest/minetest_game $(BASE_PATH)/minetest/games/minetest_game
	@printf "\033[33mGetting mobs mod base sources...\033[0m\n"
	git clone https://github.com/minetest-mirrors/mobs_redo $(BASE_PATH)/minetest/mods/mobs_redo
	@printf "\033[33mGetting animals mod sources...\033[0m\n"
	git clone https://github.com/minetest-mirrors/mobs_animal $(BASE_PATH)/minetest/mods/mobs_animal
	@printf "\033[33mGetting horses mod sources...\033[0m\n"
	git clone https://github.com/minetest-mirrors/mob_horse $(BASE_PATH)/minetest/mods/mob_horse
	@printf "\033[33mGetting monsters mod sources...\033[0m\n"
	git clone https://github.com/minetest-mirrors/mobs_monster $(BASE_PATH)/minetest/mods/mobs_monster
	@printf "\033[33mGetting NPC mod sources...\033[0m\n"
	git clone https://github.com/minetest-mirrors/mobs_npc $(BASE_PATH)/minetest/mods/mobs_npc
	@printf "\033[33mGetting water mod sources...\033[0m\n"
	git clone https://github.com/minetest-mirrors/mobs_water $(BASE_PATH)/minetest/mods/mobs_water

update:
	@printf "\033[33mUpdating Minetest engine sources...\033[0m\n"
	cd minetest && git pull
	cd minetest/lib/irrlichtmt && git pull
	@printf "\033[33mUpdating Minetest game sources...\033[0m\n"
	cd $(BASE_PATH)/minetest/games/minetest_game && git pull
	@printf "\033[33mUpdating mobs mod base sources...\033[0m\n"
	cd $(BASE_PATH)/minetest/mods/mobs_redo && git pull
	@printf "\033[33mUpdating animals mod sources...\033[0m\n"
	cd $(BASE_PATH)/minetest/mods/mobs_animal && git pull
	@printf "\033[33mUpdating horses mod sources...\033[0m\n"
	cd $(BASE_PATH)/minetest/mods/mob_horse && git pull
	@printf "\033[33mUpdating monsters mod sources...\033[0m\n"
	cd $(BASE_PATH)/minetest/mods/mobs_monster && git pull
	@printf "\033[33mUpdating NPC mod sources...\033[0m\n"
	cd $(BASE_PATH)/minetest/mods/mobs_npc && git pull
	@printf "\033[33mUpdating water mod sources...\033[0m\n"
	cd $(BASE_PATH)/minetest/mods/mobs_water && git pull
