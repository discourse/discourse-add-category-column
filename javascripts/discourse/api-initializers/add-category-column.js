import discourseComputed from "discourse-common/utils/decorators";
import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("0.8", api => {
  api.modifyClass("component:topic-list-item", {
    pluginId: "add-category-column",
    @discourseComputed("topic.isPinnedUncategorized")
    titleColSpan(isPinnedUncategorized) {
      return !this.hideCategory && isPinnedUncategorized ? 2 : 1;
    }
  });
});
