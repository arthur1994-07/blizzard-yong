package CTFReward_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class RewardInfo_1 extends MovieClip
    {
        public var CTF_List8:ListItemRenderer_CTFReward;
        public var CTF_List9:ListItemRenderer_CTFReward;
        public var CTF_List6:ListItemRenderer_CTFReward;
        public var CTF_List10:ListItemRenderer_CTFReward;
        public var CTF_List7:ListItemRenderer_CTFReward;
        public var CTF_List11:ListItemRenderer_CTFReward;
        public var CTF_List4:ListItemRenderer_CTFReward;
        public var CTF_List12:ListItemRenderer_CTFReward;
        public var CTF_List5:ListItemRenderer_CTFReward;
        public var CTF_List13:ListItemRenderer_CTFReward;
        public var CTF_List2:ListItemRenderer_CTFReward;
        public var CTF_List3:ListItemRenderer_CTFReward;
        public var title_label:MovieClip;
        public var CTF_List1:ListItemRenderer_CTFReward;
        public var labelCloseWindow:TextField;
        public var MyInfo:ListItemRenderer_CTFReward;
        public var List:ScrollingList;
        public var btnCancel:Button;
        public var List_scrollbar:ScrollBar;

        public function RewardInfo_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_List_RewardInfo_List_0();
            this.__setProp_CTF_List1_RewardInfo_renderer_0();
            this.__setProp_CTF_List2_RewardInfo_renderer_0();
            this.__setProp_CTF_List3_RewardInfo_renderer_0();
            this.__setProp_CTF_List4_RewardInfo_renderer_0();
            this.__setProp_CTF_List5_RewardInfo_renderer_0();
            this.__setProp_CTF_List6_RewardInfo_renderer_0();
            this.__setProp_CTF_List7_RewardInfo_renderer_0();
            this.__setProp_CTF_List8_RewardInfo_renderer_0();
            this.__setProp_CTF_List9_RewardInfo_renderer_0();
            this.__setProp_CTF_List10_RewardInfo_renderer_0();
            this.__setProp_CTF_List11_RewardInfo_renderer_0();
            this.__setProp_CTF_List12_RewardInfo_renderer_0();
            this.__setProp_CTF_List13_RewardInfo_renderer_0();
            this.__setProp_List_scrollbar_RewardInfo_renderer_0();
            this.__setProp_btnCancel_RewardInfo_Btn_0();
            return;
        }// end function

        function __setProp_List_RewardInfo_List_0()
        {
            try
            {
                this.List["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.List.enabled = true;
            this.List.focusable = false;
            this.List.itemRendererName = "";
            this.List.itemRendererInstanceName = "CTF_List";
            this.List.margin = 0;
            this.List.multiSelect = false;
            this.List.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.List.rowHeight = 0;
            this.List.scrollBar = "";
            this.List.treeButtonClassName = "";
            this.List.treeButtonGap = -1;
            this.List.treeCheckBoxClassName = "";
            this.List.treeList = false;
            this.List.visible = true;
            this.List.wrapping = "normal";
            try
            {
                this.List["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List1_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List1.autoRepeat = false;
            this.CTF_List1.autoSize = "none";
            this.CTF_List1.enabled = true;
            this.CTF_List1.groupName = "";
            this.CTF_List1.label = "";
            this.CTF_List1.overlayAlign = "none";
            this.CTF_List1.overlayImg = "";
            this.CTF_List1.overlayPadding = {x:0, y:0};
            this.CTF_List1.preventAutoSize = false;
            this.CTF_List1.selected = false;
            this.CTF_List1.toggle = false;
            this.CTF_List1.usePrevLabel = false;
            this.CTF_List1.visible = true;
            try
            {
                this.CTF_List1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List2_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List2.autoRepeat = false;
            this.CTF_List2.autoSize = "none";
            this.CTF_List2.enabled = true;
            this.CTF_List2.groupName = "";
            this.CTF_List2.label = "";
            this.CTF_List2.overlayAlign = "none";
            this.CTF_List2.overlayImg = "";
            this.CTF_List2.overlayPadding = {x:0, y:0};
            this.CTF_List2.preventAutoSize = false;
            this.CTF_List2.selected = false;
            this.CTF_List2.toggle = false;
            this.CTF_List2.usePrevLabel = false;
            this.CTF_List2.visible = true;
            try
            {
                this.CTF_List2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List3_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List3.autoRepeat = false;
            this.CTF_List3.autoSize = "none";
            this.CTF_List3.enabled = true;
            this.CTF_List3.groupName = "";
            this.CTF_List3.label = "";
            this.CTF_List3.overlayAlign = "none";
            this.CTF_List3.overlayImg = "";
            this.CTF_List3.overlayPadding = {x:0, y:0};
            this.CTF_List3.preventAutoSize = false;
            this.CTF_List3.selected = false;
            this.CTF_List3.toggle = false;
            this.CTF_List3.usePrevLabel = false;
            this.CTF_List3.visible = true;
            try
            {
                this.CTF_List3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List4_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List4.autoRepeat = false;
            this.CTF_List4.autoSize = "none";
            this.CTF_List4.enabled = true;
            this.CTF_List4.groupName = "";
            this.CTF_List4.label = "";
            this.CTF_List4.overlayAlign = "none";
            this.CTF_List4.overlayImg = "";
            this.CTF_List4.overlayPadding = {x:0, y:0};
            this.CTF_List4.preventAutoSize = false;
            this.CTF_List4.selected = false;
            this.CTF_List4.toggle = false;
            this.CTF_List4.usePrevLabel = false;
            this.CTF_List4.visible = true;
            try
            {
                this.CTF_List4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List5_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List5.autoRepeat = false;
            this.CTF_List5.autoSize = "none";
            this.CTF_List5.enabled = true;
            this.CTF_List5.groupName = "";
            this.CTF_List5.label = "";
            this.CTF_List5.overlayAlign = "none";
            this.CTF_List5.overlayImg = "";
            this.CTF_List5.overlayPadding = {x:0, y:0};
            this.CTF_List5.preventAutoSize = false;
            this.CTF_List5.selected = false;
            this.CTF_List5.toggle = false;
            this.CTF_List5.usePrevLabel = false;
            this.CTF_List5.visible = true;
            try
            {
                this.CTF_List5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List6_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List6.autoRepeat = false;
            this.CTF_List6.autoSize = "none";
            this.CTF_List6.enabled = true;
            this.CTF_List6.groupName = "";
            this.CTF_List6.label = "";
            this.CTF_List6.overlayAlign = "none";
            this.CTF_List6.overlayImg = "";
            this.CTF_List6.overlayPadding = {x:0, y:0};
            this.CTF_List6.preventAutoSize = false;
            this.CTF_List6.selected = false;
            this.CTF_List6.toggle = false;
            this.CTF_List6.usePrevLabel = false;
            this.CTF_List6.visible = true;
            try
            {
                this.CTF_List6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List7_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List7.autoRepeat = false;
            this.CTF_List7.autoSize = "none";
            this.CTF_List7.enabled = true;
            this.CTF_List7.groupName = "";
            this.CTF_List7.label = "";
            this.CTF_List7.overlayAlign = "none";
            this.CTF_List7.overlayImg = "";
            this.CTF_List7.overlayPadding = {x:0, y:0};
            this.CTF_List7.preventAutoSize = false;
            this.CTF_List7.selected = false;
            this.CTF_List7.toggle = false;
            this.CTF_List7.usePrevLabel = false;
            this.CTF_List7.visible = true;
            try
            {
                this.CTF_List7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List8_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List8.autoRepeat = false;
            this.CTF_List8.autoSize = "none";
            this.CTF_List8.enabled = true;
            this.CTF_List8.groupName = "";
            this.CTF_List8.label = "";
            this.CTF_List8.overlayAlign = "none";
            this.CTF_List8.overlayImg = "";
            this.CTF_List8.overlayPadding = {x:0, y:0};
            this.CTF_List8.preventAutoSize = false;
            this.CTF_List8.selected = false;
            this.CTF_List8.toggle = false;
            this.CTF_List8.usePrevLabel = false;
            this.CTF_List8.visible = true;
            try
            {
                this.CTF_List8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List9_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List9.autoRepeat = false;
            this.CTF_List9.autoSize = "none";
            this.CTF_List9.enabled = true;
            this.CTF_List9.groupName = "";
            this.CTF_List9.label = "";
            this.CTF_List9.overlayAlign = "none";
            this.CTF_List9.overlayImg = "";
            this.CTF_List9.overlayPadding = {x:0, y:0};
            this.CTF_List9.preventAutoSize = false;
            this.CTF_List9.selected = false;
            this.CTF_List9.toggle = false;
            this.CTF_List9.usePrevLabel = false;
            this.CTF_List9.visible = true;
            try
            {
                this.CTF_List9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List10_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List10["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List10.autoRepeat = false;
            this.CTF_List10.autoSize = "none";
            this.CTF_List10.enabled = true;
            this.CTF_List10.groupName = "";
            this.CTF_List10.label = "";
            this.CTF_List10.overlayAlign = "none";
            this.CTF_List10.overlayImg = "";
            this.CTF_List10.overlayPadding = {x:0, y:0};
            this.CTF_List10.preventAutoSize = false;
            this.CTF_List10.selected = false;
            this.CTF_List10.toggle = false;
            this.CTF_List10.usePrevLabel = false;
            this.CTF_List10.visible = true;
            try
            {
                this.CTF_List10["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List11_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List11["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List11.autoRepeat = false;
            this.CTF_List11.autoSize = "none";
            this.CTF_List11.enabled = true;
            this.CTF_List11.groupName = "";
            this.CTF_List11.label = "";
            this.CTF_List11.overlayAlign = "none";
            this.CTF_List11.overlayImg = "";
            this.CTF_List11.overlayPadding = {x:0, y:0};
            this.CTF_List11.preventAutoSize = false;
            this.CTF_List11.selected = false;
            this.CTF_List11.toggle = false;
            this.CTF_List11.usePrevLabel = false;
            this.CTF_List11.visible = true;
            try
            {
                this.CTF_List11["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List12_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List12["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List12.autoRepeat = false;
            this.CTF_List12.autoSize = "none";
            this.CTF_List12.enabled = true;
            this.CTF_List12.groupName = "";
            this.CTF_List12.label = "";
            this.CTF_List12.overlayAlign = "none";
            this.CTF_List12.overlayImg = "";
            this.CTF_List12.overlayPadding = {x:0, y:0};
            this.CTF_List12.preventAutoSize = false;
            this.CTF_List12.selected = false;
            this.CTF_List12.toggle = false;
            this.CTF_List12.usePrevLabel = false;
            this.CTF_List12.visible = true;
            try
            {
                this.CTF_List12["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_CTF_List13_RewardInfo_renderer_0()
        {
            try
            {
                this.CTF_List13["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.CTF_List13.autoRepeat = false;
            this.CTF_List13.autoSize = "none";
            this.CTF_List13.enabled = true;
            this.CTF_List13.groupName = "";
            this.CTF_List13.label = "";
            this.CTF_List13.overlayAlign = "none";
            this.CTF_List13.overlayImg = "";
            this.CTF_List13.overlayPadding = {x:0, y:0};
            this.CTF_List13.preventAutoSize = false;
            this.CTF_List13.selected = false;
            this.CTF_List13.toggle = false;
            this.CTF_List13.usePrevLabel = false;
            this.CTF_List13.visible = true;
            try
            {
                this.CTF_List13["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_List_scrollbar_RewardInfo_renderer_0()
        {
            try
            {
                this.List_scrollbar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.List_scrollbar.enabled = true;
            this.List_scrollbar.minThumbSize = 10;
            this.List_scrollbar.offsetBottom = 0;
            this.List_scrollbar.offsetTop = 0;
            this.List_scrollbar.scrollTarget = "List";
            this.List_scrollbar.trackMode = "scrollPage";
            this.List_scrollbar.visible = true;
            try
            {
                this.List_scrollbar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCancel_RewardInfo_Btn_0()
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
            this.btnCancel.label = "DefautlButton";
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

        function frame1()
        {
            return;
        }// end function

    }
}
