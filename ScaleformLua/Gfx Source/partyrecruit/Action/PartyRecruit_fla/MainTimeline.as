package PartyRecruit_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var item5:PartyRecruitListItemRenderer;
        public var item6:PartyRecruitListItemRenderer;
        public var item7:PartyRecruitListItemRenderer;
        public var item8:PartyRecruitListItemRenderer;
        public var item1:PartyRecruitListItemRenderer;
        public var item2:PartyRecruitListItemRenderer;
        public var item3:PartyRecruitListItemRenderer;
        public var item4:PartyRecruitListItemRenderer;
        public var labelType:Label;
        public var labelClass:Label;
        public var labelName:Label;
        public var labelLevel:Label;
        public var btn:Button;
        public var scrollBar:ScrollBar;
        public var list:ScrollingList;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_scrollBar_Scene1_scroll_0();
            this.__setProp_list_Scene1_list_0();
            this.__setProp_labelType_Scene1_label_0();
            this.__setProp_labelClass_Scene1_label_0();
            this.__setProp_labelName_Scene1_label_0();
            this.__setProp_labelLevel_Scene1_label_0();
            this.__setProp_btn_Scene1_btn_0();
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

        function __setProp_labelType_Scene1_label_0()
        {
            try
            {
                this.labelType["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelType.autoSize = "center";
            this.labelType.enabled = true;
            this.labelType.text = "";
            this.labelType.visible = true;
            try
            {
                this.labelType["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelClass_Scene1_label_0()
        {
            try
            {
                this.labelClass["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelClass.autoSize = "center";
            this.labelClass.enabled = true;
            this.labelClass.text = "";
            this.labelClass.visible = true;
            try
            {
                this.labelClass["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelName_Scene1_label_0()
        {
            try
            {
                this.labelName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelName.autoSize = "center";
            this.labelName.enabled = true;
            this.labelName.text = "";
            this.labelName.visible = true;
            try
            {
                this.labelName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelLevel_Scene1_label_0()
        {
            try
            {
                this.labelLevel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelLevel.autoSize = "center";
            this.labelLevel.enabled = true;
            this.labelLevel.text = "";
            this.labelLevel.visible = true;
            try
            {
                this.labelLevel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btn_Scene1_btn_0()
        {
            try
            {
                this.btn["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btn.autoRepeat = false;
            this.btn.autoSize = "none";
            this.btn.enabled = true;
            this.btn.focusable = false;
            this.btn.groupName = "";
            this.btn.label = "";
            this.btn.overlayAlign = "none";
            this.btn.overlayImg = "";
            this.btn.overlayPadding = {x:0, y:0};
            this.btn.preventAutoSize = true;
            this.btn.selected = false;
            this.btn.toggle = false;
            this.btn.visible = true;
            try
            {
                this.btn["componentInspectorSetting"] = false;
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
