package PartyDistribution_member_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var item5:DistributionMemberListItemRenderer;
        public var item6:DistributionMemberListItemRenderer;
        public var item7:DistributionMemberListItemRenderer;
        public var item10:DistributionMemberListItemRenderer;
        public var item8:DistributionMemberListItemRenderer;
        public var item9:DistributionMemberListItemRenderer;
        public var item1:DistributionMemberListItemRenderer;
        public var item2:DistributionMemberListItemRenderer;
        public var item3:DistributionMemberListItemRenderer;
        public var item4:DistributionMemberListItemRenderer;
        public var btnTransfer:Button;
        public var list:ScrollingList;
        public var scrollBar:ScrollBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnTransfer_Scene1_Button_0();
            this.__setProp_list_Scene1_list_0();
            this.__setProp_scrollBar_Scene1_scroll_0();
            this.__setProp_item1_Scene1_item_0();
            this.__setProp_item2_Scene1_item_0();
            this.__setProp_item3_Scene1_item_0();
            this.__setProp_item4_Scene1_item_0();
            this.__setProp_item5_Scene1_item_0();
            this.__setProp_item6_Scene1_item_0();
            this.__setProp_item7_Scene1_item_0();
            this.__setProp_item8_Scene1_item_0();
            this.__setProp_item9_Scene1_item_0();
            this.__setProp_item10_Scene1_item_0();
            return;
        }// end function

        function __setProp_btnTransfer_Scene1_Button_0()
        {
            try
            {
                this.btnTransfer["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnTransfer.autoRepeat = false;
            this.btnTransfer.autoSize = "none";
            this.btnTransfer.enabled = true;
            this.btnTransfer.focusable = false;
            this.btnTransfer.groupName = "";
            this.btnTransfer.label = "";
            this.btnTransfer.overlayAlign = "none";
            this.btnTransfer.overlayImg = "";
            this.btnTransfer.overlayPadding = {x:0, y:0};
            this.btnTransfer.preventAutoSize = false;
            this.btnTransfer.selected = false;
            this.btnTransfer.toggle = false;
            this.btnTransfer.visible = true;
            try
            {
                this.btnTransfer["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_Scene1_list_0()
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
            this.list.multiSelect = true;
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

        function __setProp_scrollBar_Scene1_scroll_0()
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

        function __setProp_item1_Scene1_item_0()
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
            this.item1.everyFrameUpdate = false;
            this.item1.groupName = "";
            this.item1.label = "";
            this.item1.overlayAlign = "none";
            this.item1.overlayImg = "";
            this.item1.overlayPadding = {x:0, y:0};
            this.item1.preventAutoSize = true;
            this.item1.selected = false;
            this.item1.toggle = false;
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

        function __setProp_item2_Scene1_item_0()
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
            this.item2.everyFrameUpdate = false;
            this.item2.groupName = "";
            this.item2.label = "";
            this.item2.overlayAlign = "none";
            this.item2.overlayImg = "";
            this.item2.overlayPadding = {x:0, y:0};
            this.item2.preventAutoSize = true;
            this.item2.selected = false;
            this.item2.toggle = false;
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

        function __setProp_item3_Scene1_item_0()
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
            this.item3.everyFrameUpdate = false;
            this.item3.groupName = "";
            this.item3.label = "";
            this.item3.overlayAlign = "none";
            this.item3.overlayImg = "";
            this.item3.overlayPadding = {x:0, y:0};
            this.item3.preventAutoSize = true;
            this.item3.selected = false;
            this.item3.toggle = false;
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

        function __setProp_item4_Scene1_item_0()
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
            this.item4.everyFrameUpdate = false;
            this.item4.groupName = "";
            this.item4.label = "";
            this.item4.overlayAlign = "none";
            this.item4.overlayImg = "";
            this.item4.overlayPadding = {x:0, y:0};
            this.item4.preventAutoSize = true;
            this.item4.selected = false;
            this.item4.toggle = false;
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

        function __setProp_item5_Scene1_item_0()
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
            this.item5.everyFrameUpdate = false;
            this.item5.groupName = "";
            this.item5.label = "";
            this.item5.overlayAlign = "none";
            this.item5.overlayImg = "";
            this.item5.overlayPadding = {x:0, y:0};
            this.item5.preventAutoSize = true;
            this.item5.selected = false;
            this.item5.toggle = false;
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

        function __setProp_item6_Scene1_item_0()
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
            this.item6.everyFrameUpdate = false;
            this.item6.groupName = "";
            this.item6.label = "";
            this.item6.overlayAlign = "none";
            this.item6.overlayImg = "";
            this.item6.overlayPadding = {x:0, y:0};
            this.item6.preventAutoSize = true;
            this.item6.selected = false;
            this.item6.toggle = false;
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

        function __setProp_item7_Scene1_item_0()
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
            this.item7.everyFrameUpdate = false;
            this.item7.groupName = "";
            this.item7.label = "";
            this.item7.overlayAlign = "none";
            this.item7.overlayImg = "";
            this.item7.overlayPadding = {x:0, y:0};
            this.item7.preventAutoSize = true;
            this.item7.selected = false;
            this.item7.toggle = false;
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

        function __setProp_item8_Scene1_item_0()
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
            this.item8.everyFrameUpdate = false;
            this.item8.groupName = "";
            this.item8.label = "";
            this.item8.overlayAlign = "none";
            this.item8.overlayImg = "";
            this.item8.overlayPadding = {x:0, y:0};
            this.item8.preventAutoSize = true;
            this.item8.selected = false;
            this.item8.toggle = false;
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

        function __setProp_item9_Scene1_item_0()
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
            this.item9.everyFrameUpdate = false;
            this.item9.groupName = "";
            this.item9.label = "";
            this.item9.overlayAlign = "none";
            this.item9.overlayImg = "";
            this.item9.overlayPadding = {x:0, y:0};
            this.item9.preventAutoSize = true;
            this.item9.selected = false;
            this.item9.toggle = false;
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

        function __setProp_item10_Scene1_item_0()
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
            this.item10.everyFrameUpdate = false;
            this.item10.groupName = "";
            this.item10.label = "";
            this.item10.overlayAlign = "none";
            this.item10.overlayImg = "";
            this.item10.overlayPadding = {x:0, y:0};
            this.item10.preventAutoSize = true;
            this.item10.selected = false;
            this.item10.toggle = false;
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

        function frame1()
        {
            return;
        }// end function

    }
}
