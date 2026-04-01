package UISwitch_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var UnCheckAllBtn:Button;
        public var InnerUIOnBtn:Button;
        public var InnerUIOffBtn:Button;
        public var ComponentGrade:Label;
        public var UISwitchList:ScrollingList;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_UISwitchList_Scene1_list_0();
            this.__setProp_UnCheckAllBtn_Scene1_button_0();
            this.__setProp_InnerUIOnBtn_Scene1_button_0();
            this.__setProp_InnerUIOffBtn_Scene1_button_0();
            return;
        }// end function

        function __setProp_UISwitchList_Scene1_list_0()
        {
            try
            {
                this.UISwitchList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.UISwitchList.enabled = true;
            this.UISwitchList.focusable = true;
            this.UISwitchList.itemRendererName = "ListItemRenderer_checkbox";
            this.UISwitchList.itemRendererInstanceName = "";
            this.UISwitchList.margin = 0;
            this.UISwitchList.multiSelect = true;
            this.UISwitchList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.UISwitchList.rowHeight = 0;
            this.UISwitchList.scrollBar = "DefaultScrollBar";
            this.UISwitchList.treeButtonClassName = "";
            this.UISwitchList.treeButtonGap = -1;
            this.UISwitchList.treeCheckBoxClassName = "";
            this.UISwitchList.treeList = false;
            this.UISwitchList.visible = true;
            this.UISwitchList.wrapping = "normal";
            try
            {
                this.UISwitchList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_UnCheckAllBtn_Scene1_button_0()
        {
            try
            {
                this.UnCheckAllBtn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.UnCheckAllBtn.autoRepeat = false;
            this.UnCheckAllBtn.autoSize = "none";
            this.UnCheckAllBtn.enabled = true;
            this.UnCheckAllBtn.focusable = true;
            this.UnCheckAllBtn.groupName = "";
            this.UnCheckAllBtn.label = "UnCheckAll";
            this.UnCheckAllBtn.overlayAlign = "none";
            this.UnCheckAllBtn.overlayImg = "";
            this.UnCheckAllBtn.overlayPadding = {x:0, y:0};
            this.UnCheckAllBtn.preventAutoSize = false;
            this.UnCheckAllBtn.selected = false;
            this.UnCheckAllBtn.toggle = false;
            this.UnCheckAllBtn.visible = true;
            try
            {
                this.UnCheckAllBtn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InnerUIOnBtn_Scene1_button_0()
        {
            try
            {
                this.InnerUIOnBtn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InnerUIOnBtn.autoRepeat = false;
            this.InnerUIOnBtn.autoSize = "none";
            this.InnerUIOnBtn.enabled = true;
            this.InnerUIOnBtn.focusable = true;
            this.InnerUIOnBtn.groupName = "";
            this.InnerUIOnBtn.label = "InnerUIon";
            this.InnerUIOnBtn.overlayAlign = "none";
            this.InnerUIOnBtn.overlayImg = "";
            this.InnerUIOnBtn.overlayPadding = {x:0, y:0};
            this.InnerUIOnBtn.preventAutoSize = false;
            this.InnerUIOnBtn.selected = false;
            this.InnerUIOnBtn.toggle = false;
            this.InnerUIOnBtn.visible = true;
            try
            {
                this.InnerUIOnBtn["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_InnerUIOffBtn_Scene1_button_0()
        {
            try
            {
                this.InnerUIOffBtn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.InnerUIOffBtn.autoRepeat = false;
            this.InnerUIOffBtn.autoSize = "none";
            this.InnerUIOffBtn.enabled = true;
            this.InnerUIOffBtn.focusable = true;
            this.InnerUIOffBtn.groupName = "";
            this.InnerUIOffBtn.label = "InnerUIoff";
            this.InnerUIOffBtn.overlayAlign = "none";
            this.InnerUIOffBtn.overlayImg = "";
            this.InnerUIOffBtn.overlayPadding = {x:0, y:0};
            this.InnerUIOffBtn.preventAutoSize = false;
            this.InnerUIOffBtn.selected = false;
            this.InnerUIOffBtn.toggle = false;
            this.InnerUIOffBtn.visible = true;
            try
            {
                this.InnerUIOffBtn["componentInspectorSetting"] = false;
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
