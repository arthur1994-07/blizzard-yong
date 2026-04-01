package PartyDistribution_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var item1:ListItemRenderer;
        public var item2:ListItemRenderer;
        public var item3:ListItemRenderer;
        public var item4:ListItemRenderer;
        public var item5:ListItemRenderer;
        public var slot1:Slot;
        public var slot2:Slot;
        public var slot3:Slot;
        public var slot4:Slot;
        public var slot5:Slot;
        public var btnGiveUp:Button;
        public var btnBidding:Button;
        public var btnDiscard:Button;
        public var list:ScrollingList;
        public var scrollBar:ScrollBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnGiveUp_Scene1_Layer1_0();
            this.__setProp_btnBidding_Scene1_Layer1_0();
            this.__setProp_btnDiscard_Scene1_Layer1_0();
            this.__setProp_list_Scene1_list_0();
            this.__setProp_scrollBar_Scene1_scroll_0();
            return;
        }// end function

        function __setProp_btnGiveUp_Scene1_Layer1_0()
        {
            try
            {
                this.btnGiveUp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnGiveUp.autoRepeat = false;
            this.btnGiveUp.autoSize = "none";
            this.btnGiveUp.enabled = true;
            this.btnGiveUp.focusable = false;
            this.btnGiveUp.groupName = "";
            this.btnGiveUp.label = "";
            this.btnGiveUp.overlayAlign = "none";
            this.btnGiveUp.overlayImg = "";
            this.btnGiveUp.overlayPadding = {x:0, y:0};
            this.btnGiveUp.preventAutoSize = false;
            this.btnGiveUp.selected = false;
            this.btnGiveUp.toggle = false;
            this.btnGiveUp.visible = true;
            try
            {
                this.btnGiveUp["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnBidding_Scene1_Layer1_0()
        {
            try
            {
                this.btnBidding["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnBidding.autoRepeat = false;
            this.btnBidding.autoSize = "none";
            this.btnBidding.enabled = true;
            this.btnBidding.focusable = false;
            this.btnBidding.groupName = "";
            this.btnBidding.label = "";
            this.btnBidding.overlayAlign = "none";
            this.btnBidding.overlayImg = "";
            this.btnBidding.overlayPadding = {x:0, y:0};
            this.btnBidding.preventAutoSize = false;
            this.btnBidding.selected = false;
            this.btnBidding.toggle = false;
            this.btnBidding.visible = true;
            try
            {
                this.btnBidding["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDiscard_Scene1_Layer1_0()
        {
            try
            {
                this.btnDiscard["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDiscard.autoRepeat = false;
            this.btnDiscard.autoSize = "none";
            this.btnDiscard.enabled = true;
            this.btnDiscard.focusable = false;
            this.btnDiscard.groupName = "";
            this.btnDiscard.label = "";
            this.btnDiscard.overlayAlign = "none";
            this.btnDiscard.overlayImg = "";
            this.btnDiscard.overlayPadding = {x:0, y:0};
            this.btnDiscard.preventAutoSize = false;
            this.btnDiscard.selected = false;
            this.btnDiscard.toggle = false;
            this.btnDiscard.visible = true;
            try
            {
                this.btnDiscard["componentInspectorSetting"] = false;
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

        function frame1()
        {
            return;
        }// end function

    }
}
