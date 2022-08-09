import { Controller } from "@hotwired/stimulus";
import Calendar from "color-calendar"
import "color-calendar/dist/css/theme-glass.css";

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  initialize(){
    new Calendar({
      id: "#calendar",
      calendarSize: "small",
      monthDisplayType: "long",
      theme: "glass",
    })
  }
}
