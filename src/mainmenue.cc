/*
 * Copyright (C) 2001 by Holger Rapp 
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 */

#include "input.h"
#include "cursor.h"
#include "graphic.h"
#include "ui.h"
#include "fileloc.h"
#include "font.h"
#include "setup.h"
#include "counter.h"
#include "output.h"

#ifndef VERSION
#include "config.h"
#endif /* VERSION */

#include <string.h>


bool should_update=true;

void click(const bool b, const unsigned int x, const unsigned int y, void* ) {
		 exit(0);
}

void mcf1(const bool b, const unsigned int x, const unsigned int y, void*) {
}

void mmf(const unsigned int x, const unsigned int y, const int xdiff, const int ydiff, const bool b1, const bool b2, 
					 void* ) {
		  should_update=1;
}

/** void main_menue(void);
 * 
 * This functions runs the main menu. There, you can select
 * between different playmodes, exit and so on.
 *
 * Args: None
 * Returns: Nothing
 */
void main_menue(void) {
		  static Font_Handler f; // Global instance for the hole game
		  static User_Interface ui; // Global instance for the hole game

		  // Setup font handler and user interface for the use in widelands
		  setup_fonthandler();
		  setup_ui();

		  // Set to 640x480 so that we know on what we are and the pictures
		  // look good
		  //unsigned int lx=g_gr.get_xres();
		  //unsigned int ly=g_gr.get_yres();
		  g_gr.set_mode(640, 480, g_gr.get_mode());
		  g_ip.set_max_cords(640, 480);

		  // make the background window, fill it with the splash screen
/*		  Window* win=g_ui.create_window(0, 0, g_gr.get_xres(), g_gr.get_yres(), Window::FLAT);
		  Pic* p = new Pic;
		  const char* str=g_fileloc.locate_file("splash.bmp", TYPE_PIC);
		  assert(str);
		  p->load(str);
		  assert(p);
		  
		  win->set_new_bg(p);		 
		  // Create the different areas
		  char buf[100];
		  strcpy(buf, "Version: ");
		  strcat(buf, VERSION);
		  win->create_textarea(640, 480, buf, Textarea::RIGHTA);
*/
		  Window* win=g_ui.create_window(100, 100, 200, 200);
		  win->create_textarea(0, 0, 800, Textarea::LEFTA)->set_text("Hallo Du da!");
		  // Register the resposible mouse funtions
		  g_ip.register_mcf(click, Input::BUT1);
		  g_ip.register_mcf(mcf1, Input::BUT2);
	     g_ip.register_mmf(mmf);
		 
		  Counter c;
		  c.start();
		  while(!g_ip.should_die()) {
					 g_ip.handle_pending_input(); 
					 if(should_update) {
								g_ui.draw();
								g_cur.draw(g_ip.get_mpx(), g_ip.get_mpy());
								g_gr.update_screen(); // g_gr.update_quarter();
								should_update=0;
					 }
		  }
		  return; 
}
