package 
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class ProductList extends MovieClip
    {
        public var item5:ProductListItemRenderer;
        public var item6:ProductListItemRenderer;
        public var item7:ProductListItemRenderer;
        public var item10:ProductListItemRenderer;
        public var item8:ProductListItemRenderer;
        public var item11:ProductListItemRenderer;
        public var item9:ProductListItemRenderer;
        public var item12:ProductListItemRenderer;
        public var item1:ProductListItemRenderer;
        public var item2:ProductListItemRenderer;
        public var item3:ProductListItemRenderer;
        public var item4:ProductListItemRenderer;
        public var list:TileList;
        public var productlist_scrollbar:ScrollBar;

        public function ProductList()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_ProductList_TileList_0();
            this.__setProp_productlist_scrollbar_ProductList_ScrollBar_0();
            this.__setProp_item1_ProductList_Renderers_0();
            this.__setProp_item2_ProductList_Renderers_0();
            this.__setProp_item3_ProductList_Renderers_0();
            this.__setProp_item4_ProductList_Renderers_0();
            this.__setProp_item5_ProductList_Renderers_0();
            this.__setProp_item6_ProductList_Renderers_0();
            this.__setProp_item7_ProductList_Renderers_0();
            this.__setProp_item8_ProductList_Renderers_0();
            this.__setProp_item9_ProductList_Renderers_0();
            this.__setProp_item10_ProductList_Renderers_0();
            this.__setProp_item11_ProductList_Renderers_0();
            this.__setProp_item12_ProductList_Renderers_0();
            return;
        }// end function

        function __setProp_list_ProductList_TileList_0()
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
            this.list.externalColumnCount = 0;
            this.list.focusable = true;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "item";
            this.list.margin = 0;
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

        function __setProp_productlist_scrollbar_ProductList_ScrollBar_0()
        {
            try
            {
                this.productlist_scrollbar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.productlist_scrollbar.enabled = true;
            this.productlist_scrollbar.minThumbSize = 10;
            this.productlist_scrollbar.offsetBottom = 0;
            this.productlist_scrollbar.offsetTop = 0;
            this.productlist_scrollbar.scrollTarget = "list";
            this.productlist_scrollbar.trackMode = "scrollPage";
            this.productlist_scrollbar.visible = true;
            try
            {
                this.productlist_scrollbar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item1_ProductList_Renderers_0()
        {
            try
            {
                this.item1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item1.autoRepeat = false;
            this.item1.autoSize = "none";
            this.item1.enabled = true;
            this.item1.groupName = "";
            this.item1.label = "";
            this.item1.overlayAlign = "none";
            this.item1.overlayImg = "";
            this.item1.overlayPadding = {x:0, y:0};
            this.item1.preventAutoSize = true;
            this.item1.selected = false;
            this.item1.toggle = false;
            this.item1.usePrevLabel = true;
            this.item1.visible = true;
            try
            {
                this.item1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item2_ProductList_Renderers_0()
        {
            try
            {
                this.item2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item2.autoRepeat = false;
            this.item2.autoSize = "none";
            this.item2.enabled = true;
            this.item2.groupName = "";
            this.item2.label = "";
            this.item2.overlayAlign = "none";
            this.item2.overlayImg = "";
            this.item2.overlayPadding = {x:0, y:0};
            this.item2.preventAutoSize = true;
            this.item2.selected = false;
            this.item2.toggle = false;
            this.item2.usePrevLabel = true;
            this.item2.visible = true;
            try
            {
                this.item2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item3_ProductList_Renderers_0()
        {
            try
            {
                this.item3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item3.autoRepeat = false;
            this.item3.autoSize = "none";
            this.item3.enabled = true;
            this.item3.groupName = "";
            this.item3.label = "";
            this.item3.overlayAlign = "none";
            this.item3.overlayImg = "";
            this.item3.overlayPadding = {x:0, y:0};
            this.item3.preventAutoSize = true;
            this.item3.selected = false;
            this.item3.toggle = false;
            this.item3.usePrevLabel = true;
            this.item3.visible = true;
            try
            {
                this.item3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item4_ProductList_Renderers_0()
        {
            try
            {
                this.item4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item4.autoRepeat = false;
            this.item4.autoSize = "none";
            this.item4.enabled = true;
            this.item4.groupName = "";
            this.item4.label = "";
            this.item4.overlayAlign = "none";
            this.item4.overlayImg = "";
            this.item4.overlayPadding = {x:0, y:0};
            this.item4.preventAutoSize = true;
            this.item4.selected = false;
            this.item4.toggle = false;
            this.item4.usePrevLabel = true;
            this.item4.visible = true;
            try
            {
                this.item4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item5_ProductList_Renderers_0()
        {
            try
            {
                this.item5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item5.autoRepeat = false;
            this.item5.autoSize = "none";
            this.item5.enabled = true;
            this.item5.groupName = "";
            this.item5.label = "";
            this.item5.overlayAlign = "none";
            this.item5.overlayImg = "";
            this.item5.overlayPadding = {x:0, y:0};
            this.item5.preventAutoSize = true;
            this.item5.selected = false;
            this.item5.toggle = false;
            this.item5.usePrevLabel = true;
            this.item5.visible = true;
            try
            {
                this.item5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item6_ProductList_Renderers_0()
        {
            try
            {
                this.item6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item6.autoRepeat = false;
            this.item6.autoSize = "none";
            this.item6.enabled = true;
            this.item6.groupName = "";
            this.item6.label = "";
            this.item6.overlayAlign = "none";
            this.item6.overlayImg = "";
            this.item6.overlayPadding = {x:0, y:0};
            this.item6.preventAutoSize = true;
            this.item6.selected = false;
            this.item6.toggle = false;
            this.item6.usePrevLabel = true;
            this.item6.visible = true;
            try
            {
                this.item6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item7_ProductList_Renderers_0()
        {
            try
            {
                this.item7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item7.autoRepeat = false;
            this.item7.autoSize = "none";
            this.item7.enabled = true;
            this.item7.groupName = "";
            this.item7.label = "";
            this.item7.overlayAlign = "none";
            this.item7.overlayImg = "";
            this.item7.overlayPadding = {x:0, y:0};
            this.item7.preventAutoSize = true;
            this.item7.selected = false;
            this.item7.toggle = false;
            this.item7.usePrevLabel = true;
            this.item7.visible = true;
            try
            {
                this.item7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item8_ProductList_Renderers_0()
        {
            try
            {
                this.item8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item8.autoRepeat = false;
            this.item8.autoSize = "none";
            this.item8.enabled = true;
            this.item8.groupName = "";
            this.item8.label = "";
            this.item8.overlayAlign = "none";
            this.item8.overlayImg = "";
            this.item8.overlayPadding = {x:0, y:0};
            this.item8.preventAutoSize = true;
            this.item8.selected = false;
            this.item8.toggle = false;
            this.item8.usePrevLabel = true;
            this.item8.visible = true;
            try
            {
                this.item8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item9_ProductList_Renderers_0()
        {
            try
            {
                this.item9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item9.autoRepeat = false;
            this.item9.autoSize = "none";
            this.item9.enabled = true;
            this.item9.groupName = "";
            this.item9.label = "";
            this.item9.overlayAlign = "none";
            this.item9.overlayImg = "";
            this.item9.overlayPadding = {x:0, y:0};
            this.item9.preventAutoSize = true;
            this.item9.selected = false;
            this.item9.toggle = false;
            this.item9.usePrevLabel = true;
            this.item9.visible = true;
            try
            {
                this.item9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item10_ProductList_Renderers_0()
        {
            try
            {
                this.item10["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item10.autoRepeat = false;
            this.item10.autoSize = "none";
            this.item10.enabled = true;
            this.item10.groupName = "";
            this.item10.label = "";
            this.item10.overlayAlign = "none";
            this.item10.overlayImg = "";
            this.item10.overlayPadding = {x:0, y:0};
            this.item10.preventAutoSize = true;
            this.item10.selected = false;
            this.item10.toggle = false;
            this.item10.usePrevLabel = true;
            this.item10.visible = true;
            try
            {
                this.item10["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item11_ProductList_Renderers_0()
        {
            try
            {
                this.item11["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item11.autoRepeat = false;
            this.item11.autoSize = "none";
            this.item11.enabled = true;
            this.item11.groupName = "";
            this.item11.label = "";
            this.item11.overlayAlign = "none";
            this.item11.overlayImg = "";
            this.item11.overlayPadding = {x:0, y:0};
            this.item11.preventAutoSize = true;
            this.item11.selected = false;
            this.item11.toggle = false;
            this.item11.usePrevLabel = true;
            this.item11.visible = true;
            try
            {
                this.item11["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item12_ProductList_Renderers_0()
        {
            try
            {
                this.item12["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item12.autoRepeat = false;
            this.item12.autoSize = "none";
            this.item12.enabled = true;
            this.item12.groupName = "";
            this.item12.label = "";
            this.item12.overlayAlign = "none";
            this.item12.overlayImg = "";
            this.item12.overlayPadding = {x:0, y:0};
            this.item12.preventAutoSize = true;
            this.item12.selected = false;
            this.item12.toggle = false;
            this.item12.usePrevLabel = true;
            this.item12.visible = true;
            try
            {
                this.item12["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
