dirname = path.dirname(__file__)

tribes:new_ware_type {
   msgctxt = "ware",
   name = "trident_double",
   -- TRANSLATORS: This is a ware name used in lists of wares
   descname = pgettext("ware", "Double Trident"),
   helptext_script = dirname .. "helptexts.lua",
   icon = dirname .. "menu.png",
   default_target_quantity = {
      atlanteans = 1
   },
   preciousness = {
      atlanteans = 1
   },

   animations = {
      idle = {
         pictures = path.list_files(dirname .. "idle.png"),
         hotspot = { 10, 17 },
      },
   }
}
