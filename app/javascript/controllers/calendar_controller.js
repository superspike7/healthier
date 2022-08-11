import { Controller } from "@hotwired/stimulus";
import Calendar from "color-calendar";
import "color-calendar/dist/css/theme-glass.css";

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  
  initialize(){
    this.loadSchedules()
    
    this.calendar = new Calendar({
      id: "#calendar",
      calendarSize: "small",
      monthDisplayType: "long",
      theme: "glass",
      dateChanged: (currentDate, events) => {
        const query = { date: currentDate, events: JSON.stringify(events) };
        const url = `/schedule_preview?${new URLSearchParams(
          query
        ).toString()}`;
        let frame = document.querySelector("turbo-frame#preview");
        frame.src = url;
      },
    });
  }

  loadSchedules() {
    fetch("/schedules")
      .then((response) => response.json())
      .then(response => this.calendar.setEventsData(response))
  }
}
