import { withPluginApi } from "discourse/lib/plugin-api";
export default {
  name: "add-category-column",
  initialize(container) {
    withPluginApi("0.8", api => {
      api.modifyClass("component:topic-list-item", {
        titleColSpan: function() {
          return !this.get("hideCategory") &&
            this.get("topic.isPinnedUncategorized")
            ? 2
            : 1;
        }.property("topic.isPinnedUncategorized")
      });
    });
  }
};
