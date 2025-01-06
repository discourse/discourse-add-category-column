import SortableColumn from "discourse/components/topic-list/header/sortable-column";
import categoryLink from "discourse/helpers/category-link";
import { apiInitializer } from "discourse/lib/api";

const HeaderCell = <template>
  <SortableColumn
    @sortable={{@sortable}}
    @order="category"
    @activeOrder={{@activeOrder}}
    @changeSort={{@changeSort}}
    @ascending={{@ascending}}
    @name="category_title"
  />
</template>;

const ItemCell = <template>
  <td class="category topic-list-data">
    {{#unless @topic.isPinnedUncategorized}}
      {{categoryLink @topic.category}}
    {{/unless}}
  </td>
</template>;

export default apiInitializer("0.8", (api) => {
  api.registerValueTransformer("topic-list-columns", ({ value: columns }) => {
    if (api.container.lookup("service:site").desktopView) {
      columns.add(
        "category",
        { header: HeaderCell, item: ItemCell },
        { after: "topic", before: "posters" }
      );
    }
    return columns;
  });
});
