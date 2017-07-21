dirname = path.dirname(__file__)

tribes:new_productionsite_type {
   msgctxt = "frisians_building",
   name = "frisians_reindeer_farm",
   -- TRANSLATORS: This is a building name used in lists of buildings
   descname = pgettext("frisians_building", "Reindeer Farm"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   size = "big",

   buildcost = {
      brick = 3,
      granite = 2,
      log = 2,
      thatch_reed = 3
   },
   return_on_dismantle = {
      brick = 2,
      granite = 1,
      log = 1,
      thatch_reed = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle_??.png"),
         hotspot = { 69, 64 },
      },
      working = {
         pictures = path.list_files(dirname .. "working_??.png"),
         hotspot = { 69, 64 },
      },
   },

   aihints = {
      recruitment = true,
      prohibited_till = 500
   },

   working_positions = {
      frisians_reindeer_breeder = 1
   },

   inputs = {
      { name = "barley", amount = 8 },
      { name = "water", amount = 8 }
   },
   outputs = {
      "frisians_reindeer",
      "fur"
   },

   programs = {
      work = {
         -- TRANSLATORS: Completed/Skipped/Did not start working because ...
         descname = pgettext("frisians_building", "working"),
         actions = {
            "call=make_fur",
            "call=recruit_deer",
            "call=make_fur",
            "return=skipped",
         }
      },
      recruit_deer = {
         -- TRANSLATORS: Completed/Skipped/Did not start rearing cattle because ...
         descname = pgettext("frisians_building", "rearing reindeer"),
         actions = {
            "return=skipped unless economy needs frisians_reindeer",
            "sleep=5000",
            "consume=barley water",
            "animate=working 25000",
            "recruit=frisians_reindeer"
         }
      },
      make_fur = {
         -- TRANSLATORS: Completed/Skipped/Did not start producing fur because ...
         descname = pgettext("frisians_building", "producing fur"),
         actions = {
            "return=skipped unless economy needs fur",
            "sleep=15000",
            "consume=barley water",
            "animate=working 20000",
            "produce=fur"
         }
      },
   },
}
