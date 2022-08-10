import { Controller } from "@hotwired/stimulus";
import Calendar from "color-calendar";
import "color-calendar/dist/css/theme-glass.css";

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  initialize() {
    new Calendar({
      id: "#calendar",
      calendarSize: "small",
      monthDisplayType: "long",
      theme: "glass",
      eventsData: [
        {
          id: 1,
          name: "French class",
          start: "2022-08-17T06:00:00",
          end: "2022-08-18T20:30:00",
        },
        {
          id: 2,
          name: "Blockchain 101",
          start: "2022-08-20T10:00:00",
          end: "2022-08-20T11:30:00",
        },
        {
          id: 3,
          name: "Morning Routine",
          start: "2022-08-10T10:00:00",
          end: "2022-08-10T11:30:00",
        },
        {
          id: 4,
          name: "Challenge Pushups",
          start: "2022-08-10T15:00:00",
          end: "2022-08-10T15:30:00",
        },
      ],
      dateChanged: (currentDate, events) => {
        const query = {date: currentDate, events: JSON.stringify(events)}
        const url = `/schedule_preview?${new URLSearchParams(query).toString()}`
        console.log({url})
        let frame = document.querySelector('turbo-frame#preview')
        frame.src = url
      },
    });
  }
}
