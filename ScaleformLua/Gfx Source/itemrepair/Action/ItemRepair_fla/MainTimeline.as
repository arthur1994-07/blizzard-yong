package ItemRepair_fla
{
    import flash.display.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var labelTip:Label;
        public var labelTotalStatic:Label;
        public var labelTotal:Label;
        public var list:ScrollingList;
        public var scrollBar:ScrollBar;
        public var btnRepair:Button;
        public var btnRepairAll:Button;
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

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelTip_Scene1_list_0();
            this.__setProp_list_Scene1_list_0();
            this.__setProp_item1_Scene1_list_0();
            this.__setProp_item2_Scene1_list_0();
            this.__setProp_item3_Scene1_list_0();
            this.__setProp_item4_Scene1_list_0();
            this.__setProp_item5_Scene1_list_0();
            this.__setProp_labelTotal_Scene1_list_0();
            this.__setProp_labelTotalStatic_Scene1_list_0();
            this.__setProp_btnRepairAll_Scene1_list_0();
            this.__setProp_btnRepair_Scene1_list_0();
            return;
        }// end function

        function __setProp_labelTip_Scene1_list_0()
        {
            try
            {
                this.labelTip["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTip.autoSize = "left";
            this.labelTip.enabled = true;
            this.labelTip.text = "";
            this.labelTip.visible = true;
            try
            {
                this.labelTip["componentInspectorSetting"] = false;
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

        function __setProp_item1_Scene1_list_0()
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

        function __setProp_item2_Scene1_list_0()
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

        function __setProp_item3_Scene1_list_0()
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

        function __setProp_item4_Scene1_list_0()
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

        function __setProp_item5_Scene1_list_0()
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

        function __setProp_labelTotal_Scene1_list_0()
        {
            try
            {
                this.labelTotal["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTotal.autoSize = "right";
            this.labelTotal.enabled = true;
            this.labelTotal.text = "";
            this.labelTotal.visible = true;
            try
            {
                this.labelTotal["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTotalStatic_Scene1_list_0()
        {
            try
            {
                this.labelTotalStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTotalStatic.autoSize = "right";
            this.labelTotalStatic.enabled = true;
            this.labelTotalStatic.text = "";
            this.labelTotalStatic.visible = true;
            try
            {
                this.labelTotalStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRepairAll_Scene1_list_0()
        {
            try
            {
                this.btnRepairAll["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRepairAll.autoRepeat = false;
            this.btnRepairAll.autoSize = "none";
            this.btnRepairAll.enabled = true;
            this.btnRepairAll.focusable = false;
            this.btnRepairAll.groupName = "";
            this.btnRepairAll.label = "";
            this.btnRepairAll.overlayAlign = "none";
            this.btnRepairAll.overlayImg = "";
            this.btnRepairAll.overlayPadding = {x:0, y:0};
            this.btnRepairAll.preventAutoSize = false;
            this.btnRepairAll.selected = false;
            this.btnRepairAll.toggle = false;
            this.btnRepairAll.visible = true;
            try
            {
                this.btnRepairAll["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnRepair_Scene1_list_0()
        {
            try
            {
                this.btnRepair["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRepair.autoRepeat = false;
            this.btnRepair.autoSize = "none";
            this.btnRepair.enabled = true;
            this.btnRepair.focusable = false;
            this.btnRepair.groupName = "";
            this.btnRepair.label = "";
            this.btnRepair.overlayAlign = "none";
            this.btnRepair.overlayImg = "";
            this.btnRepair.overlayPadding = {x:0, y:0};
            this.btnRepair.preventAutoSize = false;
            this.btnRepair.selected = false;
            this.btnRepair.toggle = false;
            this.btnRepair.visible = true;
            try
            {
                this.btnRepair["componentInspectorSetting"] = false;
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
