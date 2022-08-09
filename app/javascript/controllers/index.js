// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application";

import TurboModalController from "./turbo_modal_controller.js";
application.register("turbo-modal", TurboModalController);

import CalendarController from "./calendar_controller.js";
application.register("calendar", CalendarController);

import VanishController from "./vanish_controller.js";
application.register("vanish", VanishController);

import TomSelectController from "./tom_select_controller.js";
application.register("tom-select", TomSelectController);

import SecondModalController from "./second_modal_controller.js";
application.register("second-modal", SecondModalController);
