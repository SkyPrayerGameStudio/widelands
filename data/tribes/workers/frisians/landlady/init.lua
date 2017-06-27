dirname = path.dirname(__file__)

animations = {
   idle = {
      pictures = path.list_files(dirname .. "idle_??.png"),
      hotspot = { 6, 28 },
   }
}
add_walking_animations(animations, "walk", dirname, "walk", {11, 24}, 15)
add_walking_animations(animations, "walkload", dirname, "walk", {11, 24}, 15)


tribes:new_worker_type {
   msgctxt = "frisians_worker",
   name = "frisians_landlady",
   -- TRANSLATORS: This is a worker name used in lists of workers
   descname = pgettext("frisians_worker", "Landlady"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   vision_range = 2,

   buildcost = {
      frisians_carrier = 1,
      kitchen_tools = 1
   },

   animations = animations,
}
