import EmberObject from "@ember/object";

export default class extends EmberObject {
  get hideCategory() {
    return this.parent.context.hideCategory;
  }

  get sortable() {
    return this.parent.context.sortable;
  }
}
