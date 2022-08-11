import { Controller } from "@hotwired/stimulus";
import TomSelect from "tom-select";
import "../entrypoints/tom-select.css";
import { useMutation } from 'stimulus-use'

export default class extends Controller {
  static values = {
    url: String
  }

  initialize() {
    useMutation(this, { childList: true })
  }

  connect() {
    this.select = new TomSelect(this.element, {
      create: (input) => {
        let frame = document.querySelector("turbo-frame#second-modal");
        frame.src = `${this.element.dataset.url}${input}`;
      },
    });
  }

  mutate(entries){
    const options = entries[0].target.options
    const option = options[options.length - 1] 
    this.select.addOption({value: option.value, text: option.text })
    this.select.refreshOptions()
    this.select.addItem(option.value)
  }
}
