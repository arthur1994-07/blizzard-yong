package StudentRecord_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class ActivityPage_7 extends MovieClip
    {
        public var list:MovieClip;
        public var btnHelp:Button;
        public var CompletedCountTitle:Label;
        public var CompletedCount2:Label;
        public var ActivityPoint2:Label;
        public var CompletedCount1:Label;
        public var ActivityPoint1:Label;
        public var CompletedCount0:Label;
        public var ActivityPoint0:Label;
        public var SalesItemButton2:Button;
        public var SalesItemButton1:Button;
        public var SalesItemButton0:Button;
        public var ListButton0:Button;
        public var ListButton1:Button;
        public var ListButton2:Button;
        public var ListButton3:Button;
        public var scrollList:ScrollingList;
        public var ProgressDisplay:CheckBox;
        public var ProgressDisplay_text:Label;

        public function ActivityPage_7()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_scrollList_ActivityPage_list_0();
            this.__setProp_CompletedCountTitle_ActivityPage_button_0();
            this.__setProp_SalesItemButton2_ActivityPage_button_0();
            this.__setProp_SalesItemButton1_ActivityPage_button_0();
            this.__setProp_SalesItemButton0_ActivityPage_button_0();
            this.__setProp_ListButton0_ActivityPage_button_0();
            this.__setProp_ListButton1_ActivityPage_button_0();
            this.__setProp_ListButton2_ActivityPage_button_0();
            this.__setProp_ListButton3_ActivityPage_button_0();
            this.__setProp_btnHelp_ActivityPage_help_0();
            return;
        }// end function

        function __setProp_scrollList_ActivityPage_list_0()
        {
            try
            {
                this.scrollList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scrollList.enabled = true;
            this.scrollList.focusable = true;
            this.scrollList.itemRendererName = "TreeItemRenderer";
            this.scrollList.itemRendererInstanceName = "";
            this.scrollList.margin = 0;
            this.scrollList.multiSelect = false;
            this.scrollList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.scrollList.rowHeight = 0;
            this.scrollList.scrollBar = "DefaultScrollBar";
            this.scrollList.treeButtonClassName = "TreeButton";
            this.scrollList.treeButtonGap = -1;
            this.scrollList.treeCheckBoxClassName = "";
            this.scrollList.treeList = true;
            this.scrollList.visible = true;
            this.scrollList.wrapping = "normal";
            try
            {
                this.scrollList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CompletedCountTitle_ActivityPage_button_0()
        {
            try
            {
                this.CompletedCountTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CompletedCountTitle.autoSize = "center";
            this.CompletedCountTitle.autoSizeEnable = false;
            this.CompletedCountTitle.enabled = true;
            this.CompletedCountTitle.text = "";
            this.CompletedCountTitle.visible = true;
            try
            {
                this.CompletedCountTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SalesItemButton2_ActivityPage_button_0()
        {
            try
            {
                this.SalesItemButton2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SalesItemButton2.autoRepeat = false;
            this.SalesItemButton2.autoSize = "none";
            this.SalesItemButton2.enabled = true;
            this.SalesItemButton2.focusable = false;
            this.SalesItemButton2.groupName = "";
            this.SalesItemButton2.label = "DefautlButton";
            this.SalesItemButton2.overlayAlign = "none";
            this.SalesItemButton2.overlayImg = "";
            this.SalesItemButton2.overlayPadding = {x:0, y:0};
            this.SalesItemButton2.selected = false;
            this.SalesItemButton2.toggle = false;
            this.SalesItemButton2.visible = true;
            try
            {
                this.SalesItemButton2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SalesItemButton1_ActivityPage_button_0()
        {
            try
            {
                this.SalesItemButton1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SalesItemButton1.autoRepeat = false;
            this.SalesItemButton1.autoSize = "none";
            this.SalesItemButton1.enabled = true;
            this.SalesItemButton1.focusable = false;
            this.SalesItemButton1.groupName = "";
            this.SalesItemButton1.label = "DefautlButton";
            this.SalesItemButton1.overlayAlign = "none";
            this.SalesItemButton1.overlayImg = "";
            this.SalesItemButton1.overlayPadding = {x:0, y:0};
            this.SalesItemButton1.selected = false;
            this.SalesItemButton1.toggle = false;
            this.SalesItemButton1.visible = true;
            try
            {
                this.SalesItemButton1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_SalesItemButton0_ActivityPage_button_0()
        {
            try
            {
                this.SalesItemButton0["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.SalesItemButton0.autoRepeat = false;
            this.SalesItemButton0.autoSize = "none";
            this.SalesItemButton0.enabled = true;
            this.SalesItemButton0.focusable = false;
            this.SalesItemButton0.groupName = "";
            this.SalesItemButton0.label = "DefautlButton";
            this.SalesItemButton0.overlayAlign = "none";
            this.SalesItemButton0.overlayImg = "";
            this.SalesItemButton0.overlayPadding = {x:0, y:0};
            this.SalesItemButton0.selected = false;
            this.SalesItemButton0.toggle = false;
            this.SalesItemButton0.visible = true;
            try
            {
                this.SalesItemButton0["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ListButton0_ActivityPage_button_0()
        {
            try
            {
                this.ListButton0["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ListButton0.autoRepeat = false;
            this.ListButton0.autoSize = "none";
            this.ListButton0.enabled = true;
            this.ListButton0.focusable = false;
            this.ListButton0.groupName = "";
            this.ListButton0.label = "";
            this.ListButton0.overlayAlign = "none";
            this.ListButton0.overlayImg = "";
            this.ListButton0.overlayPadding = {x:0, y:0};
            this.ListButton0.selected = false;
            this.ListButton0.toggle = false;
            this.ListButton0.visible = true;
            try
            {
                this.ListButton0["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ListButton1_ActivityPage_button_0()
        {
            try
            {
                this.ListButton1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ListButton1.autoRepeat = false;
            this.ListButton1.autoSize = "none";
            this.ListButton1.enabled = true;
            this.ListButton1.focusable = false;
            this.ListButton1.groupName = "";
            this.ListButton1.label = "";
            this.ListButton1.overlayAlign = "none";
            this.ListButton1.overlayImg = "";
            this.ListButton1.overlayPadding = {x:0, y:0};
            this.ListButton1.selected = false;
            this.ListButton1.toggle = false;
            this.ListButton1.visible = true;
            try
            {
                this.ListButton1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ListButton2_ActivityPage_button_0()
        {
            try
            {
                this.ListButton2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ListButton2.autoRepeat = false;
            this.ListButton2.autoSize = "none";
            this.ListButton2.enabled = true;
            this.ListButton2.focusable = false;
            this.ListButton2.groupName = "";
            this.ListButton2.label = "";
            this.ListButton2.overlayAlign = "none";
            this.ListButton2.overlayImg = "";
            this.ListButton2.overlayPadding = {x:0, y:0};
            this.ListButton2.selected = false;
            this.ListButton2.toggle = false;
            this.ListButton2.visible = true;
            try
            {
                this.ListButton2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_ListButton3_ActivityPage_button_0()
        {
            try
            {
                this.ListButton3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.ListButton3.autoRepeat = false;
            this.ListButton3.autoSize = "none";
            this.ListButton3.enabled = true;
            this.ListButton3.focusable = false;
            this.ListButton3.groupName = "";
            this.ListButton3.label = "";
            this.ListButton3.overlayAlign = "none";
            this.ListButton3.overlayImg = "";
            this.ListButton3.overlayPadding = {x:0, y:0};
            this.ListButton3.selected = false;
            this.ListButton3.toggle = false;
            this.ListButton3.visible = true;
            try
            {
                this.ListButton3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp_ActivityPage_help_0()
        {
            try
            {
                this.btnHelp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp.autoRepeat = false;
            this.btnHelp.autoSize = "none";
            this.btnHelp.enabled = true;
            this.btnHelp.focusable = false;
            this.btnHelp.groupName = "";
            this.btnHelp.label = "?";
            this.btnHelp.overlayAlign = "none";
            this.btnHelp.overlayImg = "";
            this.btnHelp.overlayPadding = {x:0, y:0};
            this.btnHelp.selected = false;
            this.btnHelp.toggle = false;
            this.btnHelp.visible = true;
            try
            {
                this.btnHelp["componentInspectorSetting"] = false;
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
