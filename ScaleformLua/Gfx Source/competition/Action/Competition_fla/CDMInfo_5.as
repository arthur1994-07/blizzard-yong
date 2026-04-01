package Competition_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class CDMInfo_5 extends MovieClip
    {
        public var item5:CDMListItemRenderer;
        public var item6:CDMListItemRenderer;
        public var item7:CDMListItemRenderer;
        public var item8:CDMListItemRenderer;
        public var item1:CDMListItemRenderer;
        public var item2:CDMListItemRenderer;
        public var item3:CDMListItemRenderer;
        public var item4:CDMListItemRenderer;
        public var labelTitle:Label;
        public var labelTime:Label;
        public var labelRank:Label;
        public var labelClub:Label;
        public var labelName:Label;
        public var btnCancel:Button;
        public var list:ScrollingList;
        public var scrollBar:ScrollBar;

        public function CDMInfo_5()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnCancel_CDMInfo_btn_0();
            this.__setProp_list_CDMInfo_list_0();
            this.__setProp_scrollBar_CDMInfo_scroll_0();
            this.__setProp_labelClub_CDMInfo_label_0();
            this.__setProp_labelRank_CDMInfo_label_0();
            this.__setProp_labelName_CDMInfo_label_0();
            this.__setProp_labelTitle_CDMInfo_label_0();
            this.__setProp_labelTime_CDMInfo_label_0();
            return;
        }// end function

        function __setProp_btnCancel_CDMInfo_btn_0()
        {
            try
            {
                this.btnCancel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCancel.autoRepeat = false;
            this.btnCancel.autoSize = "none";
            this.btnCancel.enabled = true;
            this.btnCancel.focusable = false;
            this.btnCancel.groupName = "";
            this.btnCancel.label = "";
            this.btnCancel.overlayAlign = "none";
            this.btnCancel.overlayImg = "";
            this.btnCancel.overlayPadding = {x:0, y:0};
            this.btnCancel.selected = false;
            this.btnCancel.toggle = false;
            this.btnCancel.visible = true;
            try
            {
                this.btnCancel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_CDMInfo_list_0()
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

        function __setProp_scrollBar_CDMInfo_scroll_0()
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

        function __setProp_labelClub_CDMInfo_label_0()
        {
            try
            {
                this.labelClub["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelClub.autoSize = "center";
            this.labelClub.autoSizeEnable = false;
            this.labelClub.enabled = true;
            this.labelClub.text = "";
            this.labelClub.visible = true;
            try
            {
                this.labelClub["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelRank_CDMInfo_label_0()
        {
            try
            {
                this.labelRank["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelRank.autoSize = "center";
            this.labelRank.autoSizeEnable = false;
            this.labelRank.enabled = true;
            this.labelRank.text = "";
            this.labelRank.visible = true;
            try
            {
                this.labelRank["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelName_CDMInfo_label_0()
        {
            try
            {
                this.labelName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelName.autoSize = "center";
            this.labelName.autoSizeEnable = false;
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

        function __setProp_labelTitle_CDMInfo_label_0()
        {
            try
            {
                this.labelTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle.autoSize = "left";
            this.labelTitle.autoSizeEnable = false;
            this.labelTitle.enabled = true;
            this.labelTitle.text = "";
            this.labelTitle.visible = true;
            try
            {
                this.labelTitle["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTime_CDMInfo_label_0()
        {
            try
            {
                this.labelTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTime.autoSize = "right";
            this.labelTime.autoSizeEnable = false;
            this.labelTime.enabled = true;
            this.labelTime.text = "";
            this.labelTime.visible = true;
            try
            {
                this.labelTime["componentInspectorSetting"] = false;
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
