package StudentRecord_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class ActivityPage_List_8 extends MovieClip
    {
        public var item5:ActivityPageListItemRenderer;
        public var item6:ActivityPageListItemRenderer;
        public var item1:ActivityPageListItemRenderer;
        public var item2:ActivityPageListItemRenderer;
        public var item3:ActivityPageListItemRenderer;
        public var item4:ActivityPageListItemRenderer;
        public var tileScroll:ScrollBar;
        public var list:ScrollingList;
        public var TitletextField1:Label;
        public var TitletextField2:Label;
        public var TitletextField3:Label;
        public var TitletextField4:Label;

        public function ActivityPage_List_8()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_TitletextField2_ActivityPage_List_text_0();
            this.__setProp_TitletextField4_ActivityPage_List_text_0();
            this.__setProp_list_ActivityPage_List_list_0();
            this.__setProp_tileScroll_ActivityPage_List_scroll_0();
            this.__setProp_item1_ActivityPage_List_item_0();
            this.__setProp_item2_ActivityPage_List_item_0();
            this.__setProp_item3_ActivityPage_List_item_0();
            this.__setProp_item4_ActivityPage_List_item_0();
            this.__setProp_item5_ActivityPage_List_item_0();
            this.__setProp_item6_ActivityPage_List_item_0();
            return;
        }// end function

        function __setProp_TitletextField2_ActivityPage_List_text_0()
        {
            try
            {
                this.TitletextField2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TitletextField2.autoSize = "center";
            this.TitletextField2.autoSizeEnable = false;
            this.TitletextField2.enabled = true;
            this.TitletextField2.text = "";
            this.TitletextField2.visible = true;
            try
            {
                this.TitletextField2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TitletextField4_ActivityPage_List_text_0()
        {
            try
            {
                this.TitletextField4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TitletextField4.autoSize = "center";
            this.TitletextField4.autoSizeEnable = false;
            this.TitletextField4.enabled = true;
            this.TitletextField4.text = "";
            this.TitletextField4.visible = true;
            try
            {
                this.TitletextField4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_ActivityPage_List_list_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = true;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "item";
            this.list.margin = 0;
            this.list.multiSelect = false;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "";
            this.list.treeButtonClassName = "";
            this.list.treeButtonGap = -1;
            this.list.treeCheckBoxClassName = "";
            this.list.treeList = false;
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

        function __setProp_tileScroll_ActivityPage_List_scroll_0()
        {
            try
            {
                this.tileScroll["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tileScroll.enabled = true;
            this.tileScroll.minThumbSize = 10;
            this.tileScroll.offsetBottom = 0;
            this.tileScroll.offsetTop = 0;
            this.tileScroll.scrollTarget = "list";
            this.tileScroll.trackMode = "scrollPage";
            this.tileScroll.visible = true;
            try
            {
                this.tileScroll["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item1_ActivityPage_List_item_0()
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
            this.item1.preventAutoSize = false;
            this.item1.selected = false;
            this.item1.toggle = false;
            this.item1.usePrevLabel = false;
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

        function __setProp_item2_ActivityPage_List_item_0()
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
            this.item2.preventAutoSize = false;
            this.item2.selected = false;
            this.item2.toggle = false;
            this.item2.usePrevLabel = false;
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

        function __setProp_item3_ActivityPage_List_item_0()
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
            this.item3.preventAutoSize = false;
            this.item3.selected = false;
            this.item3.toggle = false;
            this.item3.usePrevLabel = false;
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

        function __setProp_item4_ActivityPage_List_item_0()
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
            this.item4.preventAutoSize = false;
            this.item4.selected = false;
            this.item4.toggle = false;
            this.item4.usePrevLabel = false;
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

        function __setProp_item5_ActivityPage_List_item_0()
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
            this.item5.preventAutoSize = false;
            this.item5.selected = false;
            this.item5.toggle = false;
            this.item5.usePrevLabel = false;
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

        function __setProp_item6_ActivityPage_List_item_0()
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
            this.item6.preventAutoSize = false;
            this.item6.selected = false;
            this.item6.toggle = false;
            this.item6.usePrevLabel = false;
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

        function frame1()
        {
            return;
        }// end function

    }
}
