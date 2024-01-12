import EmberObject from "@ember/object";

export default class extends EmberObject {
    get hideCategory() {
        return this.parent.context.hideCategory;
    }
}