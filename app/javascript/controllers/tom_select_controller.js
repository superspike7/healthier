import { Controller } from "@hotwired/stimulus";
import TomSelect from "tom-select";
import "../entrypoints/tom-select.css";

export default class extends Controller {
  static values = {
    url: String
  }

  connect() {
    new TomSelect(this.element, {
      render: {
        no_results: function (data, escape) {
          return `
          <div class="create active">
            <a data-turbo-frame="second-modal" href="${escape(this.input.dataset.url)}${escape(data.input)}" class="w-full block">
              <p>add</p> <strong>${escape(data.input)}</strong>
            </a>
          </div>
          `;
        },
      },
    });
  }
}
