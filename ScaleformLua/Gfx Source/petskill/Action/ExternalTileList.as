package 
{
    import flash.display.*;

    dynamic public class ExternalTileList extends MovieClip
    {
        public var item5:DefaultListItemRenderer;
        public var item6:DefaultListItemRenderer;
        public var item7:DefaultListItemRenderer;
        public var item10:DefaultListItemRenderer;
        public var item8:DefaultListItemRenderer;
        public var scrollBar:DefaultScrollBar;
        public var item9:DefaultListItemRenderer;
        public var list:DefaultTileList;
        public var item1:DefaultListItemRenderer;
        public var item2:DefaultListItemRenderer;
        public var item3:DefaultListItemRenderer;
        public var item4:DefaultListItemRenderer;

        public function ExternalTileList()
        {
            this.__setProp_list_ExternalTileList_TileList_0();
            this.__setProp_scrollBar_ExternalTileList_ScrollBar_0();
            return;
        }// end function

        function __setProp_list_ExternalTileList_TileList_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.columnWidth = 0;
            this.list.direction = "vertical";
            this.list.enabled = true;
            this.list.externalColumnCount = 2;
            this.list.focusable = true;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "item";
            this.list.margin = 1;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "";
            this.list.visible = true;
            this.list.wrapping = "normal";
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scrollBar_ExternalTileList_ScrollBar_0()
        {
            try
            {
                this.scrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scrollBar.enabled = true;
            this.scrollBar.minThumbSize = 10;
            this.scrollBar.offsetBottom = 0;
            this.scrollBar.offsetTop = 0;
            this.scrollBar.scrollTarget = "list";
            this.scrollBar.trackMode = "scrollPage";
            this.scrollBar.visible = true;
            try
            {
                this.scrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
