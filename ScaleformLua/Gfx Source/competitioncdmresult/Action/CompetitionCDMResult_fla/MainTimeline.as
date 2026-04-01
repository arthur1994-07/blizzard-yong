package CompetitionCDMResult_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var mcReward:MovieClip;
        public var scrollBar:ScrollBar;
        public var list:ScrollingList;
        public var item1:ListItemRenderer;
        public var item2:ListItemRenderer;
        public var item3:ListItemRenderer;
        public var item4:ListItemRenderer;
        public var item5:ListItemRenderer;
        public var item6:ListItemRenderer;
        public var item7:ListItemRenderer;
        public var item8:ListItemRenderer;
        public var item9:ListItemRenderer;
        public var item10:ListItemRenderer;
        public var item11:ListItemRenderer;
        public var item12:ListItemRenderer;
        public var item13:ListItemRenderer;
        public var item14:ListItemRenderer;
        public var item15:ListItemRenderer;
        public var item16:ListItemRenderer;
        public var btnReward1:Button;
        public var btnReward2:Button;
        public var btnReward3:Button;
        public var btnReward4:Button;
        public var btnReward5:Button;
        public var btnReward6:Button;
        public var btnReward7:Button;
        public var btnReward8:Button;
        public var btnReward9:Button;
        public var btnReward10:Button;
        public var btnReward11:Button;
        public var btnReward12:Button;
        public var btnReward13:Button;
        public var btnReward14:Button;
        public var btnReward15:Button;
        public var btnReward16:Button;
        public var btnOut:Button;
        public var labelTime:Label;
        public var tfTitle1:Label;
        public var tfTitle2:Label;
        public var tfTitle3:Label;
        public var tfTitle4:Label;
        public var tfTitle5:Label;
        public var tfTitle6:Label;
        public var tfTitle7:Label;
        public var tfTitle8:Label;
        public var tfTitle9:Label;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
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
            this.__setProp_item11_Scene1_item_0();
            this.__setProp_item12_Scene1_item_0();
            this.__setProp_item13_Scene1_item_0();
            this.__setProp_item14_Scene1_item_0();
            this.__setProp_item15_Scene1_item_0();
            this.__setProp_item16_Scene1_item_0();
            this.__setProp_btnReward1_Scene1_rewardBtn_0();
            this.__setProp_btnReward2_Scene1_rewardBtn_0();
            this.__setProp_btnReward3_Scene1_rewardBtn_0();
            this.__setProp_btnReward4_Scene1_rewardBtn_0();
            this.__setProp_btnReward7_Scene1_rewardBtn_0();
            this.__setProp_btnReward6_Scene1_rewardBtn_0();
            this.__setProp_btnReward5_Scene1_rewardBtn_0();
            this.__setProp_btnReward12_Scene1_rewardBtn_0();
            this.__setProp_btnReward11_Scene1_rewardBtn_0();
            this.__setProp_btnReward10_Scene1_rewardBtn_0();
            this.__setProp_btnReward9_Scene1_rewardBtn_0();
            this.__setProp_btnReward8_Scene1_rewardBtn_0();
            this.__setProp_btnReward13_Scene1_rewardBtn_0();
            this.__setProp_btnReward14_Scene1_rewardBtn_0();
            this.__setProp_btnReward15_Scene1_rewardBtn_0();
            this.__setProp_btnReward16_Scene1_rewardBtn_0();
            this.__setProp_labelTime_Scene1_btn_0();
            this.__setProp_btnOut_Scene1_btn_0();
            this.__setProp_tfTitle1_Scene1_title_0();
            this.__setProp_tfTitle2_Scene1_title_0();
            this.__setProp_tfTitle3_Scene1_title_0();
            this.__setProp_tfTitle4_Scene1_title_0();
            this.__setProp_tfTitle5_Scene1_title_0();
            this.__setProp_tfTitle6_Scene1_title_0();
            this.__setProp_tfTitle7_Scene1_title_0();
            this.__setProp_tfTitle8_Scene1_title_0();
            this.__setProp_tfTitle9_Scene1_title_0();
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
            this.scrollBar.minThumbSize = 15;
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
            this.item7.groupName = "";
            this.item7.label = "";
            this.item7.overlayAlign = "none";
            this.item7.overlayImg = "";
            this.item7.overlayPadding = {x:0, y:0};
            this.item7.preventAutoSize = false;
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
            this.item8.groupName = "";
            this.item8.label = "";
            this.item8.overlayAlign = "none";
            this.item8.overlayImg = "";
            this.item8.overlayPadding = {x:0, y:0};
            this.item8.preventAutoSize = false;
            this.item8.selected = false;
            this.item8.toggle = false;
            this.item8.usePrevLabel = false;
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
            this.item9.groupName = "";
            this.item9.label = "";
            this.item9.overlayAlign = "none";
            this.item9.overlayImg = "";
            this.item9.overlayPadding = {x:0, y:0};
            this.item9.preventAutoSize = false;
            this.item9.selected = false;
            this.item9.toggle = false;
            this.item9.usePrevLabel = false;
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
            this.item10.groupName = "";
            this.item10.label = "";
            this.item10.overlayAlign = "none";
            this.item10.overlayImg = "";
            this.item10.overlayPadding = {x:0, y:0};
            this.item10.preventAutoSize = false;
            this.item10.selected = false;
            this.item10.toggle = false;
            this.item10.usePrevLabel = false;
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

        function __setProp_item11_Scene1_item_0()
        {
            try
            {
                this.item11["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item11.autoRepeat = false;
            this.item11.autoSize = "none";
            this.item11.enabled = true;
            this.item11.groupName = "";
            this.item11.label = "";
            this.item11.overlayAlign = "none";
            this.item11.overlayImg = "";
            this.item11.overlayPadding = {x:0, y:0};
            this.item11.preventAutoSize = false;
            this.item11.selected = false;
            this.item11.toggle = false;
            this.item11.usePrevLabel = false;
            this.item11.visible = true;
            try
            {
                this.item11["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item12_Scene1_item_0()
        {
            try
            {
                this.item12["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item12.autoRepeat = false;
            this.item12.autoSize = "none";
            this.item12.enabled = true;
            this.item12.groupName = "";
            this.item12.label = "";
            this.item12.overlayAlign = "none";
            this.item12.overlayImg = "";
            this.item12.overlayPadding = {x:0, y:0};
            this.item12.preventAutoSize = false;
            this.item12.selected = false;
            this.item12.toggle = false;
            this.item12.usePrevLabel = false;
            this.item12.visible = true;
            try
            {
                this.item12["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item13_Scene1_item_0()
        {
            try
            {
                this.item13["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item13.autoRepeat = false;
            this.item13.autoSize = "none";
            this.item13.enabled = true;
            this.item13.groupName = "";
            this.item13.label = "";
            this.item13.overlayAlign = "none";
            this.item13.overlayImg = "";
            this.item13.overlayPadding = {x:0, y:0};
            this.item13.preventAutoSize = false;
            this.item13.selected = false;
            this.item13.toggle = false;
            this.item13.usePrevLabel = false;
            this.item13.visible = true;
            try
            {
                this.item13["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item14_Scene1_item_0()
        {
            try
            {
                this.item14["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item14.autoRepeat = false;
            this.item14.autoSize = "none";
            this.item14.enabled = true;
            this.item14.groupName = "";
            this.item14.label = "";
            this.item14.overlayAlign = "none";
            this.item14.overlayImg = "";
            this.item14.overlayPadding = {x:0, y:0};
            this.item14.preventAutoSize = false;
            this.item14.selected = false;
            this.item14.toggle = false;
            this.item14.usePrevLabel = false;
            this.item14.visible = true;
            try
            {
                this.item14["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item15_Scene1_item_0()
        {
            try
            {
                this.item15["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item15.autoRepeat = false;
            this.item15.autoSize = "none";
            this.item15.enabled = true;
            this.item15.groupName = "";
            this.item15.label = "";
            this.item15.overlayAlign = "none";
            this.item15.overlayImg = "";
            this.item15.overlayPadding = {x:0, y:0};
            this.item15.preventAutoSize = false;
            this.item15.selected = false;
            this.item15.toggle = false;
            this.item15.usePrevLabel = false;
            this.item15.visible = true;
            try
            {
                this.item15["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item16_Scene1_item_0()
        {
            try
            {
                this.item16["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.item16.autoRepeat = false;
            this.item16.autoSize = "none";
            this.item16.enabled = true;
            this.item16.groupName = "";
            this.item16.label = "";
            this.item16.overlayAlign = "none";
            this.item16.overlayImg = "";
            this.item16.overlayPadding = {x:0, y:0};
            this.item16.preventAutoSize = false;
            this.item16.selected = false;
            this.item16.toggle = false;
            this.item16.usePrevLabel = false;
            this.item16.visible = true;
            try
            {
                this.item16["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward1_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward1.autoRepeat = false;
            this.btnReward1.autoSize = "none";
            this.btnReward1.enabled = true;
            this.btnReward1.focusable = false;
            this.btnReward1.groupName = "";
            this.btnReward1.label = "?";
            this.btnReward1.overlayAlign = "none";
            this.btnReward1.overlayImg = "";
            this.btnReward1.overlayPadding = {x:0, y:0};
            this.btnReward1.preventAutoSize = false;
            this.btnReward1.selected = false;
            this.btnReward1.toggle = false;
            this.btnReward1.visible = true;
            try
            {
                this.btnReward1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward2_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward2.autoRepeat = false;
            this.btnReward2.autoSize = "none";
            this.btnReward2.enabled = true;
            this.btnReward2.focusable = false;
            this.btnReward2.groupName = "";
            this.btnReward2.label = "?";
            this.btnReward2.overlayAlign = "none";
            this.btnReward2.overlayImg = "";
            this.btnReward2.overlayPadding = {x:0, y:0};
            this.btnReward2.preventAutoSize = false;
            this.btnReward2.selected = false;
            this.btnReward2.toggle = false;
            this.btnReward2.visible = true;
            try
            {
                this.btnReward2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward3_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward3.autoRepeat = false;
            this.btnReward3.autoSize = "none";
            this.btnReward3.enabled = true;
            this.btnReward3.focusable = false;
            this.btnReward3.groupName = "";
            this.btnReward3.label = "?";
            this.btnReward3.overlayAlign = "none";
            this.btnReward3.overlayImg = "";
            this.btnReward3.overlayPadding = {x:0, y:0};
            this.btnReward3.preventAutoSize = false;
            this.btnReward3.selected = false;
            this.btnReward3.toggle = false;
            this.btnReward3.visible = true;
            try
            {
                this.btnReward3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward4_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward4.autoRepeat = false;
            this.btnReward4.autoSize = "none";
            this.btnReward4.enabled = true;
            this.btnReward4.focusable = false;
            this.btnReward4.groupName = "";
            this.btnReward4.label = "?";
            this.btnReward4.overlayAlign = "none";
            this.btnReward4.overlayImg = "";
            this.btnReward4.overlayPadding = {x:0, y:0};
            this.btnReward4.preventAutoSize = false;
            this.btnReward4.selected = false;
            this.btnReward4.toggle = false;
            this.btnReward4.visible = true;
            try
            {
                this.btnReward4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward7_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward7.autoRepeat = false;
            this.btnReward7.autoSize = "none";
            this.btnReward7.enabled = true;
            this.btnReward7.focusable = false;
            this.btnReward7.groupName = "";
            this.btnReward7.label = "?";
            this.btnReward7.overlayAlign = "none";
            this.btnReward7.overlayImg = "";
            this.btnReward7.overlayPadding = {x:0, y:0};
            this.btnReward7.preventAutoSize = false;
            this.btnReward7.selected = false;
            this.btnReward7.toggle = false;
            this.btnReward7.visible = true;
            try
            {
                this.btnReward7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward6_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward6.autoRepeat = false;
            this.btnReward6.autoSize = "none";
            this.btnReward6.enabled = true;
            this.btnReward6.focusable = false;
            this.btnReward6.groupName = "";
            this.btnReward6.label = "?";
            this.btnReward6.overlayAlign = "none";
            this.btnReward6.overlayImg = "";
            this.btnReward6.overlayPadding = {x:0, y:0};
            this.btnReward6.preventAutoSize = false;
            this.btnReward6.selected = false;
            this.btnReward6.toggle = false;
            this.btnReward6.visible = true;
            try
            {
                this.btnReward6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward5_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward5.autoRepeat = false;
            this.btnReward5.autoSize = "none";
            this.btnReward5.enabled = true;
            this.btnReward5.focusable = false;
            this.btnReward5.groupName = "";
            this.btnReward5.label = "?";
            this.btnReward5.overlayAlign = "none";
            this.btnReward5.overlayImg = "";
            this.btnReward5.overlayPadding = {x:0, y:0};
            this.btnReward5.preventAutoSize = false;
            this.btnReward5.selected = false;
            this.btnReward5.toggle = false;
            this.btnReward5.visible = true;
            try
            {
                this.btnReward5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward12_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward12["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward12.autoRepeat = false;
            this.btnReward12.autoSize = "none";
            this.btnReward12.enabled = true;
            this.btnReward12.focusable = false;
            this.btnReward12.groupName = "";
            this.btnReward12.label = "?";
            this.btnReward12.overlayAlign = "none";
            this.btnReward12.overlayImg = "";
            this.btnReward12.overlayPadding = {x:0, y:0};
            this.btnReward12.preventAutoSize = false;
            this.btnReward12.selected = false;
            this.btnReward12.toggle = false;
            this.btnReward12.visible = true;
            try
            {
                this.btnReward12["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward11_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward11["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward11.autoRepeat = false;
            this.btnReward11.autoSize = "none";
            this.btnReward11.enabled = true;
            this.btnReward11.focusable = false;
            this.btnReward11.groupName = "";
            this.btnReward11.label = "?";
            this.btnReward11.overlayAlign = "none";
            this.btnReward11.overlayImg = "";
            this.btnReward11.overlayPadding = {x:0, y:0};
            this.btnReward11.preventAutoSize = false;
            this.btnReward11.selected = false;
            this.btnReward11.toggle = false;
            this.btnReward11.visible = true;
            try
            {
                this.btnReward11["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward10_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward10["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward10.autoRepeat = false;
            this.btnReward10.autoSize = "none";
            this.btnReward10.enabled = true;
            this.btnReward10.focusable = false;
            this.btnReward10.groupName = "";
            this.btnReward10.label = "?";
            this.btnReward10.overlayAlign = "none";
            this.btnReward10.overlayImg = "";
            this.btnReward10.overlayPadding = {x:0, y:0};
            this.btnReward10.preventAutoSize = false;
            this.btnReward10.selected = false;
            this.btnReward10.toggle = false;
            this.btnReward10.visible = true;
            try
            {
                this.btnReward10["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward9_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward9.autoRepeat = false;
            this.btnReward9.autoSize = "none";
            this.btnReward9.enabled = true;
            this.btnReward9.focusable = false;
            this.btnReward9.groupName = "";
            this.btnReward9.label = "?";
            this.btnReward9.overlayAlign = "none";
            this.btnReward9.overlayImg = "";
            this.btnReward9.overlayPadding = {x:0, y:0};
            this.btnReward9.preventAutoSize = false;
            this.btnReward9.selected = false;
            this.btnReward9.toggle = false;
            this.btnReward9.visible = true;
            try
            {
                this.btnReward9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward8_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward8.autoRepeat = false;
            this.btnReward8.autoSize = "none";
            this.btnReward8.enabled = true;
            this.btnReward8.focusable = false;
            this.btnReward8.groupName = "";
            this.btnReward8.label = "?";
            this.btnReward8.overlayAlign = "none";
            this.btnReward8.overlayImg = "";
            this.btnReward8.overlayPadding = {x:0, y:0};
            this.btnReward8.preventAutoSize = false;
            this.btnReward8.selected = false;
            this.btnReward8.toggle = false;
            this.btnReward8.visible = true;
            try
            {
                this.btnReward8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward13_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward13["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward13.autoRepeat = false;
            this.btnReward13.autoSize = "none";
            this.btnReward13.enabled = true;
            this.btnReward13.focusable = false;
            this.btnReward13.groupName = "";
            this.btnReward13.label = "?";
            this.btnReward13.overlayAlign = "none";
            this.btnReward13.overlayImg = "";
            this.btnReward13.overlayPadding = {x:0, y:0};
            this.btnReward13.preventAutoSize = false;
            this.btnReward13.selected = false;
            this.btnReward13.toggle = false;
            this.btnReward13.visible = true;
            try
            {
                this.btnReward13["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward14_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward14["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward14.autoRepeat = false;
            this.btnReward14.autoSize = "none";
            this.btnReward14.enabled = true;
            this.btnReward14.focusable = false;
            this.btnReward14.groupName = "";
            this.btnReward14.label = "?";
            this.btnReward14.overlayAlign = "none";
            this.btnReward14.overlayImg = "";
            this.btnReward14.overlayPadding = {x:0, y:0};
            this.btnReward14.preventAutoSize = false;
            this.btnReward14.selected = false;
            this.btnReward14.toggle = false;
            this.btnReward14.visible = true;
            try
            {
                this.btnReward14["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward15_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward15["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward15.autoRepeat = false;
            this.btnReward15.autoSize = "none";
            this.btnReward15.enabled = true;
            this.btnReward15.focusable = false;
            this.btnReward15.groupName = "";
            this.btnReward15.label = "?";
            this.btnReward15.overlayAlign = "none";
            this.btnReward15.overlayImg = "";
            this.btnReward15.overlayPadding = {x:0, y:0};
            this.btnReward15.preventAutoSize = false;
            this.btnReward15.selected = false;
            this.btnReward15.toggle = false;
            this.btnReward15.visible = true;
            try
            {
                this.btnReward15["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnReward16_Scene1_rewardBtn_0()
        {
            try
            {
                this.btnReward16["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnReward16.autoRepeat = false;
            this.btnReward16.autoSize = "none";
            this.btnReward16.enabled = true;
            this.btnReward16.focusable = false;
            this.btnReward16.groupName = "";
            this.btnReward16.label = "?";
            this.btnReward16.overlayAlign = "none";
            this.btnReward16.overlayImg = "";
            this.btnReward16.overlayPadding = {x:0, y:0};
            this.btnReward16.preventAutoSize = false;
            this.btnReward16.selected = false;
            this.btnReward16.toggle = false;
            this.btnReward16.visible = true;
            try
            {
                this.btnReward16["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTime_Scene1_btn_0()
        {
            try
            {
                this.labelTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTime.autoSize = "center";
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

        function __setProp_btnOut_Scene1_btn_0()
        {
            try
            {
                this.btnOut["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnOut.autoRepeat = false;
            this.btnOut.autoSize = "none";
            this.btnOut.enabled = true;
            this.btnOut.focusable = false;
            this.btnOut.groupName = "";
            this.btnOut.label = "";
            this.btnOut.overlayAlign = "none";
            this.btnOut.overlayImg = "";
            this.btnOut.overlayPadding = {x:0, y:0};
            this.btnOut.preventAutoSize = false;
            this.btnOut.selected = false;
            this.btnOut.toggle = false;
            this.btnOut.visible = true;
            try
            {
                this.btnOut["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfTitle1_Scene1_title_0()
        {
            try
            {
                this.tfTitle1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfTitle1.autoSize = "center";
            this.tfTitle1.autoSizeEnable = false;
            this.tfTitle1.enabled = true;
            this.tfTitle1.text = "";
            this.tfTitle1.visible = true;
            try
            {
                this.tfTitle1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfTitle2_Scene1_title_0()
        {
            try
            {
                this.tfTitle2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfTitle2.autoSize = "center";
            this.tfTitle2.autoSizeEnable = false;
            this.tfTitle2.enabled = true;
            this.tfTitle2.text = "";
            this.tfTitle2.visible = true;
            try
            {
                this.tfTitle2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfTitle3_Scene1_title_0()
        {
            try
            {
                this.tfTitle3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfTitle3.autoSize = "center";
            this.tfTitle3.autoSizeEnable = false;
            this.tfTitle3.enabled = true;
            this.tfTitle3.text = "";
            this.tfTitle3.visible = true;
            try
            {
                this.tfTitle3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfTitle4_Scene1_title_0()
        {
            try
            {
                this.tfTitle4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfTitle4.autoSize = "center";
            this.tfTitle4.autoSizeEnable = false;
            this.tfTitle4.enabled = true;
            this.tfTitle4.text = "";
            this.tfTitle4.visible = true;
            try
            {
                this.tfTitle4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfTitle5_Scene1_title_0()
        {
            try
            {
                this.tfTitle5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfTitle5.autoSize = "center";
            this.tfTitle5.autoSizeEnable = false;
            this.tfTitle5.enabled = true;
            this.tfTitle5.text = "";
            this.tfTitle5.visible = true;
            try
            {
                this.tfTitle5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfTitle6_Scene1_title_0()
        {
            try
            {
                this.tfTitle6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfTitle6.autoSize = "center";
            this.tfTitle6.autoSizeEnable = false;
            this.tfTitle6.enabled = true;
            this.tfTitle6.text = "";
            this.tfTitle6.visible = true;
            try
            {
                this.tfTitle6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfTitle7_Scene1_title_0()
        {
            try
            {
                this.tfTitle7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfTitle7.autoSize = "center";
            this.tfTitle7.autoSizeEnable = false;
            this.tfTitle7.enabled = true;
            this.tfTitle7.text = "";
            this.tfTitle7.visible = true;
            try
            {
                this.tfTitle7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfTitle8_Scene1_title_0()
        {
            try
            {
                this.tfTitle8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfTitle8.autoSize = "center";
            this.tfTitle8.autoSizeEnable = false;
            this.tfTitle8.enabled = true;
            this.tfTitle8.text = "";
            this.tfTitle8.visible = true;
            try
            {
                this.tfTitle8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tfTitle9_Scene1_title_0()
        {
            try
            {
                this.tfTitle9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tfTitle9.autoSize = "center";
            this.tfTitle9.autoSizeEnable = false;
            this.tfTitle9.enabled = true;
            this.tfTitle9.text = "";
            this.tfTitle9.visible = true;
            try
            {
                this.tfTitle9["componentInspectorSetting"] = false;
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
