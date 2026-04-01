package PostBox_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class receivePage_1 extends MovieClip
    {
        public var item5:ReceiveItemRenderer;
        public var item6:ReceiveItemRenderer;
        public var item7:ReceiveItemRenderer;
        public var item1:ReceiveItemRenderer;
        public var item2:ReceiveItemRenderer;
        public var item3:ReceiveItemRenderer;
        public var item4:ReceiveItemRenderer;
        public var checkItem1:CheckBox;
        public var checkItem2:CheckBox;
        public var checkItem3:CheckBox;
        public var checkItem4:CheckBox;
        public var checkItem5:CheckBox;
        public var checkItem6:CheckBox;
        public var checkItem7:CheckBox;
        public var allCheck:CheckBox;
        public var allCheck_text:Label;
        public var textNew:Label;
        public var db_count:Label;
        public var refreshButton:Button;
        public var receiveButton:Button;
        public var deleteButton:Button;
        public var scroll:ScrollBar;
        public var list:ScrollingList;

        public function receivePage_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_receivePage_list_0();
            this.__setProp_checkItem1_receivePage_check_0();
            this.__setProp_checkItem2_receivePage_check_0();
            this.__setProp_checkItem3_receivePage_check_0();
            this.__setProp_checkItem4_receivePage_check_0();
            this.__setProp_checkItem5_receivePage_check_0();
            this.__setProp_checkItem6_receivePage_check_0();
            this.__setProp_checkItem7_receivePage_check_0();
            this.__setProp_scroll_receivePage_scroll_0();
            this.__setProp_item1_receivePage_renderer_0();
            this.__setProp_item2_receivePage_renderer_0();
            this.__setProp_item3_receivePage_renderer_0();
            this.__setProp_item4_receivePage_renderer_0();
            this.__setProp_item5_receivePage_renderer_0();
            this.__setProp_item6_receivePage_renderer_0();
            this.__setProp_item7_receivePage_renderer_0();
            this.__setProp_deleteButton_receivePage_button_0();
            this.__setProp_refreshButton_receivePage_button_0();
            this.__setProp_receiveButton_receivePage_button_0();
            this.__setProp_db_count_receivePage_item_0();
            return;
        }// end function

        function __setProp_list_receivePage_list_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = false;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "item";
            this.list.margin = 0;
            this.list.multiSelect = false;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "DefaultScrollBar";
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

        function __setProp_checkItem1_receivePage_check_0()
        {
            try
            {
                this.checkItem1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkItem1.autoSize = "none";
            this.checkItem1.enabled = true;
            this.checkItem1.focusable = false;
            this.checkItem1.groupName = "";
            this.checkItem1.label = " ";
            this.checkItem1.overlayAlign = "none";
            this.checkItem1.overlayImg = "";
            this.checkItem1.overlayPadding = {x:0, y:0};
            this.checkItem1.selected = false;
            this.checkItem1.visible = true;
            try
            {
                this.checkItem1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkItem2_receivePage_check_0()
        {
            try
            {
                this.checkItem2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkItem2.autoSize = "none";
            this.checkItem2.enabled = true;
            this.checkItem2.focusable = false;
            this.checkItem2.groupName = "";
            this.checkItem2.label = " ";
            this.checkItem2.overlayAlign = "none";
            this.checkItem2.overlayImg = "";
            this.checkItem2.overlayPadding = {x:0, y:0};
            this.checkItem2.selected = false;
            this.checkItem2.visible = true;
            try
            {
                this.checkItem2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkItem3_receivePage_check_0()
        {
            try
            {
                this.checkItem3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkItem3.autoSize = "none";
            this.checkItem3.enabled = true;
            this.checkItem3.focusable = false;
            this.checkItem3.groupName = "";
            this.checkItem3.label = " ";
            this.checkItem3.overlayAlign = "none";
            this.checkItem3.overlayImg = "";
            this.checkItem3.overlayPadding = {x:0, y:0};
            this.checkItem3.selected = false;
            this.checkItem3.visible = true;
            try
            {
                this.checkItem3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkItem4_receivePage_check_0()
        {
            try
            {
                this.checkItem4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkItem4.autoSize = "none";
            this.checkItem4.enabled = true;
            this.checkItem4.focusable = false;
            this.checkItem4.groupName = "";
            this.checkItem4.label = " ";
            this.checkItem4.overlayAlign = "none";
            this.checkItem4.overlayImg = "";
            this.checkItem4.overlayPadding = {x:0, y:0};
            this.checkItem4.selected = false;
            this.checkItem4.visible = true;
            try
            {
                this.checkItem4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkItem5_receivePage_check_0()
        {
            try
            {
                this.checkItem5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkItem5.autoSize = "none";
            this.checkItem5.enabled = true;
            this.checkItem5.focusable = false;
            this.checkItem5.groupName = "";
            this.checkItem5.label = " ";
            this.checkItem5.overlayAlign = "none";
            this.checkItem5.overlayImg = "";
            this.checkItem5.overlayPadding = {x:0, y:0};
            this.checkItem5.selected = false;
            this.checkItem5.visible = true;
            try
            {
                this.checkItem5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkItem6_receivePage_check_0()
        {
            try
            {
                this.checkItem6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkItem6.autoSize = "none";
            this.checkItem6.enabled = true;
            this.checkItem6.focusable = false;
            this.checkItem6.groupName = "";
            this.checkItem6.label = " ";
            this.checkItem6.overlayAlign = "none";
            this.checkItem6.overlayImg = "";
            this.checkItem6.overlayPadding = {x:0, y:0};
            this.checkItem6.selected = false;
            this.checkItem6.visible = true;
            try
            {
                this.checkItem6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_checkItem7_receivePage_check_0()
        {
            try
            {
                this.checkItem7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.checkItem7.autoSize = "none";
            this.checkItem7.enabled = true;
            this.checkItem7.focusable = false;
            this.checkItem7.groupName = "";
            this.checkItem7.label = " ";
            this.checkItem7.overlayAlign = "none";
            this.checkItem7.overlayImg = "";
            this.checkItem7.overlayPadding = {x:0, y:0};
            this.checkItem7.selected = false;
            this.checkItem7.visible = true;
            try
            {
                this.checkItem7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scroll_receivePage_scroll_0()
        {
            try
            {
                this.scroll["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scroll.enabled = true;
            this.scroll.minThumbSize = 10;
            this.scroll.offsetBottom = 0;
            this.scroll.offsetTop = 0;
            this.scroll.scrollTarget = "list";
            this.scroll.trackMode = "scrollPage";
            this.scroll.visible = true;
            try
            {
                this.scroll["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item1_receivePage_renderer_0()
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

        function __setProp_item2_receivePage_renderer_0()
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

        function __setProp_item3_receivePage_renderer_0()
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

        function __setProp_item4_receivePage_renderer_0()
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

        function __setProp_item5_receivePage_renderer_0()
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

        function __setProp_item6_receivePage_renderer_0()
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

        function __setProp_item7_receivePage_renderer_0()
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
            this.item7.usePrevLabel = false;
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

        function __setProp_deleteButton_receivePage_button_0()
        {
            try
            {
                this.deleteButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.deleteButton.autoRepeat = false;
            this.deleteButton.autoSize = "none";
            this.deleteButton.enabled = true;
            this.deleteButton.focusable = false;
            this.deleteButton.groupName = "";
            this.deleteButton.label = "";
            this.deleteButton.overlayAlign = "none";
            this.deleteButton.overlayImg = "";
            this.deleteButton.overlayPadding = {x:0, y:0};
            this.deleteButton.selected = false;
            this.deleteButton.toggle = false;
            this.deleteButton.visible = true;
            try
            {
                this.deleteButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_refreshButton_receivePage_button_0()
        {
            try
            {
                this.refreshButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.refreshButton.autoRepeat = false;
            this.refreshButton.autoSize = "none";
            this.refreshButton.enabled = true;
            this.refreshButton.focusable = false;
            this.refreshButton.groupName = "";
            this.refreshButton.label = "";
            this.refreshButton.overlayAlign = "none";
            this.refreshButton.overlayImg = "";
            this.refreshButton.overlayPadding = {x:0, y:0};
            this.refreshButton.selected = false;
            this.refreshButton.toggle = false;
            this.refreshButton.visible = true;
            try
            {
                this.refreshButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_receiveButton_receivePage_button_0()
        {
            try
            {
                this.receiveButton["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.receiveButton.autoRepeat = false;
            this.receiveButton.autoSize = "none";
            this.receiveButton.enabled = true;
            this.receiveButton.focusable = false;
            this.receiveButton.groupName = "";
            this.receiveButton.label = "";
            this.receiveButton.overlayAlign = "none";
            this.receiveButton.overlayImg = "";
            this.receiveButton.overlayPadding = {x:0, y:0};
            this.receiveButton.selected = false;
            this.receiveButton.toggle = false;
            this.receiveButton.visible = true;
            try
            {
                this.receiveButton["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_db_count_receivePage_item_0()
        {
            try
            {
                this.db_count["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.db_count.autoSize = "none";
            this.db_count.autoSizeEnable = false;
            this.db_count.enabled = true;
            this.db_count.text = "누적된 편지 : 99999999";
            this.db_count.visible = true;
            try
            {
                this.db_count["componentInspectorSetting"] = false;
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
