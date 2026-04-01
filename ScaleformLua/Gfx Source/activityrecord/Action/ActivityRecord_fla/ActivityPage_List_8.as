package ActivityRecord_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class ActivityPage_List_8 extends MovieClip
    {
        public var item5:ActivityPageListItemRenderer;
        public var item6:ActivityPageListItemRenderer;
        public var item7:ActivityPageListItemRenderer;
        public var item10:ActivityPageListItemRenderer;
        public var item8:ActivityPageListItemRenderer;
        public var item11:ActivityPageListItemRenderer;
        public var item9:ActivityPageListItemRenderer;
        public var item12:ActivityPageListItemRenderer;
        public var reward1:ActivityPageRewardListItemRenderer;
        public var reward2:ActivityPageRewardListItemRenderer;
        public var reward3:ActivityPageRewardListItemRenderer;
        public var reward4:ActivityPageRewardListItemRenderer;
        public var reward12:ActivityPageRewardListItemRenderer;
        public var reward5:ActivityPageRewardListItemRenderer;
        public var reward11:ActivityPageRewardListItemRenderer;
        public var reward6:ActivityPageRewardListItemRenderer;
        public var reward10:ActivityPageRewardListItemRenderer;
        public var reward7:ActivityPageRewardListItemRenderer;
        public var reward8:ActivityPageRewardListItemRenderer;
        public var reward9:ActivityPageRewardListItemRenderer;
        public var item1:ActivityPageListItemRenderer;
        public var item2:ActivityPageListItemRenderer;
        public var item3:ActivityPageListItemRenderer;
        public var item4:ActivityPageListItemRenderer;
        public var tileScroll:ScrollBar;
        public var tileScroll1:ScrollBar;
        public var list:ScrollingList;
        public var rewardlist:ScrollingList;
        public var TitletextField1:Label;
        public var TitletextField2:Label;
        public var TitletextField3:Label;
        public var TitletextField4:Label;

        public function ActivityPage_List_8()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_TitletextField2_ActivityPage_List_text_0();
            this.__setProp_TitletextField4_ActivityPage_List_text_0();
            this.__setProp_list_ActivityPage_List_list_0();
            this.__setProp_rewardlist_ActivityPage_List_list_0();
            this.__setProp_tileScroll_ActivityPage_List_scroll_0();
            this.__setProp_tileScroll1_ActivityPage_List_scroll_0();
            this.__setProp_item1_ActivityPage_List_item_0();
            this.__setProp_item2_ActivityPage_List_item_0();
            this.__setProp_item3_ActivityPage_List_item_0();
            this.__setProp_item4_ActivityPage_List_item_0();
            this.__setProp_item5_ActivityPage_List_item_0();
            this.__setProp_item6_ActivityPage_List_item_0();
            this.__setProp_reward1_ActivityPage_List_item_0();
            this.__setProp_reward2_ActivityPage_List_item_0();
            this.__setProp_reward3_ActivityPage_List_item_0();
            this.__setProp_reward4_ActivityPage_List_item_0();
            this.__setProp_reward5_ActivityPage_List_item_0();
            this.__setProp_reward6_ActivityPage_List_item_0();
            this.__setProp_item7_ActivityPage_List_item_0();
            this.__setProp_item8_ActivityPage_List_item_0();
            this.__setProp_item9_ActivityPage_List_item_0();
            this.__setProp_item10_ActivityPage_List_item_0();
            this.__setProp_item11_ActivityPage_List_item_0();
            this.__setProp_item12_ActivityPage_List_item_0();
            this.__setProp_reward7_ActivityPage_List_item_0();
            this.__setProp_reward8_ActivityPage_List_item_0();
            this.__setProp_reward9_ActivityPage_List_item_0();
            this.__setProp_reward10_ActivityPage_List_item_0();
            this.__setProp_reward11_ActivityPage_List_item_0();
            this.__setProp_reward12_ActivityPage_List_item_0();
            return;
        }// end function

        function __setProp_TitletextField2_ActivityPage_List_text_0()
        {
            try
            {
                this.TitletextField2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TitletextField2.autoSize = "center";
            this.TitletextField2.autoSizeEnable = false;
            this.TitletextField2.enabled = true;
            this.TitletextField2.text = "";
            this.TitletextField2.visible = true;
            try
            {
                this.TitletextField2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_TitletextField4_ActivityPage_List_text_0()
        {
            try
            {
                this.TitletextField4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.TitletextField4.autoSize = "center";
            this.TitletextField4.autoSizeEnable = false;
            this.TitletextField4.enabled = true;
            this.TitletextField4.text = "";
            this.TitletextField4.visible = true;
            try
            {
                this.TitletextField4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_ActivityPage_List_list_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = true;
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

        function __setProp_rewardlist_ActivityPage_List_list_0()
        {
            try
            {
                this.rewardlist["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.rewardlist.enabled = true;
            this.rewardlist.focusable = true;
            this.rewardlist.itemRendererName = "";
            this.rewardlist.itemRendererInstanceName = "reward";
            this.rewardlist.margin = 0;
            this.rewardlist.multiSelect = false;
            this.rewardlist.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.rewardlist.rowHeight = 0;
            this.rewardlist.scrollBar = "";
            this.rewardlist.treeButtonClassName = "";
            this.rewardlist.treeButtonGap = -1;
            this.rewardlist.treeCheckBoxClassName = "";
            this.rewardlist.treeList = false;
            this.rewardlist.visible = true;
            this.rewardlist.wrapping = "normal";
            try
            {
                this.rewardlist["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tileScroll_ActivityPage_List_scroll_0()
        {
            try
            {
                this.tileScroll["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tileScroll.enabled = true;
            this.tileScroll.minThumbSize = 10;
            this.tileScroll.offsetBottom = 0;
            this.tileScroll.offsetTop = 0;
            this.tileScroll.scrollTarget = "list";
            this.tileScroll.trackMode = "scrollPage";
            this.tileScroll.visible = true;
            try
            {
                this.tileScroll["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_tileScroll1_ActivityPage_List_scroll_0()
        {
            try
            {
                this.tileScroll1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.tileScroll1.enabled = true;
            this.tileScroll1.minThumbSize = 10;
            this.tileScroll1.offsetBottom = 0;
            this.tileScroll1.offsetTop = 0;
            this.tileScroll1.scrollTarget = "rewardlist";
            this.tileScroll1.trackMode = "scrollPage";
            this.tileScroll1.visible = false;
            try
            {
                this.tileScroll1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item1_ActivityPage_List_item_0()
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

        function __setProp_item2_ActivityPage_List_item_0()
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

        function __setProp_item3_ActivityPage_List_item_0()
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

        function __setProp_item4_ActivityPage_List_item_0()
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

        function __setProp_item5_ActivityPage_List_item_0()
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

        function __setProp_item6_ActivityPage_List_item_0()
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

        function __setProp_reward1_ActivityPage_List_item_0()
        {
            try
            {
                this.reward1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward1.autoRepeat = false;
            this.reward1.autoSize = "none";
            this.reward1.enabled = true;
            this.reward1.groupName = "";
            this.reward1.label = "";
            this.reward1.overlayAlign = "none";
            this.reward1.overlayImg = "";
            this.reward1.overlayPadding = {x:0, y:0};
            this.reward1.selected = false;
            this.reward1.toggle = false;
            this.reward1.usePrevLabel = false;
            this.reward1.visible = true;
            try
            {
                this.reward1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_reward2_ActivityPage_List_item_0()
        {
            try
            {
                this.reward2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward2.autoRepeat = false;
            this.reward2.autoSize = "none";
            this.reward2.enabled = true;
            this.reward2.groupName = "";
            this.reward2.label = "";
            this.reward2.overlayAlign = "none";
            this.reward2.overlayImg = "";
            this.reward2.overlayPadding = {x:0, y:0};
            this.reward2.selected = false;
            this.reward2.toggle = false;
            this.reward2.usePrevLabel = false;
            this.reward2.visible = true;
            try
            {
                this.reward2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_reward3_ActivityPage_List_item_0()
        {
            try
            {
                this.reward3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward3.autoRepeat = false;
            this.reward3.autoSize = "none";
            this.reward3.enabled = true;
            this.reward3.groupName = "";
            this.reward3.label = "";
            this.reward3.overlayAlign = "none";
            this.reward3.overlayImg = "";
            this.reward3.overlayPadding = {x:0, y:0};
            this.reward3.selected = false;
            this.reward3.toggle = false;
            this.reward3.usePrevLabel = false;
            this.reward3.visible = true;
            try
            {
                this.reward3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_reward4_ActivityPage_List_item_0()
        {
            try
            {
                this.reward4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward4.autoRepeat = false;
            this.reward4.autoSize = "none";
            this.reward4.enabled = true;
            this.reward4.groupName = "";
            this.reward4.label = "";
            this.reward4.overlayAlign = "none";
            this.reward4.overlayImg = "";
            this.reward4.overlayPadding = {x:0, y:0};
            this.reward4.selected = false;
            this.reward4.toggle = false;
            this.reward4.usePrevLabel = false;
            this.reward4.visible = true;
            try
            {
                this.reward4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_reward5_ActivityPage_List_item_0()
        {
            try
            {
                this.reward5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward5.autoRepeat = false;
            this.reward5.autoSize = "none";
            this.reward5.enabled = true;
            this.reward5.groupName = "";
            this.reward5.label = "";
            this.reward5.overlayAlign = "none";
            this.reward5.overlayImg = "";
            this.reward5.overlayPadding = {x:0, y:0};
            this.reward5.selected = false;
            this.reward5.toggle = false;
            this.reward5.usePrevLabel = false;
            this.reward5.visible = true;
            try
            {
                this.reward5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_reward6_ActivityPage_List_item_0()
        {
            try
            {
                this.reward6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward6.autoRepeat = false;
            this.reward6.autoSize = "none";
            this.reward6.enabled = true;
            this.reward6.groupName = "";
            this.reward6.label = "";
            this.reward6.overlayAlign = "none";
            this.reward6.overlayImg = "";
            this.reward6.overlayPadding = {x:0, y:0};
            this.reward6.selected = false;
            this.reward6.toggle = false;
            this.reward6.usePrevLabel = false;
            this.reward6.visible = true;
            try
            {
                this.reward6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_item7_ActivityPage_List_item_0()
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

        function __setProp_item8_ActivityPage_List_item_0()
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

        function __setProp_item9_ActivityPage_List_item_0()
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

        function __setProp_item10_ActivityPage_List_item_0()
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

        function __setProp_item11_ActivityPage_List_item_0()
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

        function __setProp_item12_ActivityPage_List_item_0()
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

        function __setProp_reward7_ActivityPage_List_item_0()
        {
            try
            {
                this.reward7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward7.autoRepeat = false;
            this.reward7.autoSize = "none";
            this.reward7.enabled = true;
            this.reward7.groupName = "";
            this.reward7.label = "";
            this.reward7.overlayAlign = "none";
            this.reward7.overlayImg = "";
            this.reward7.overlayPadding = {x:0, y:0};
            this.reward7.selected = false;
            this.reward7.toggle = false;
            this.reward7.usePrevLabel = false;
            this.reward7.visible = true;
            try
            {
                this.reward7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_reward8_ActivityPage_List_item_0()
        {
            try
            {
                this.reward8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward8.autoRepeat = false;
            this.reward8.autoSize = "none";
            this.reward8.enabled = true;
            this.reward8.groupName = "";
            this.reward8.label = "";
            this.reward8.overlayAlign = "none";
            this.reward8.overlayImg = "";
            this.reward8.overlayPadding = {x:0, y:0};
            this.reward8.selected = false;
            this.reward8.toggle = false;
            this.reward8.usePrevLabel = false;
            this.reward8.visible = true;
            try
            {
                this.reward8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_reward9_ActivityPage_List_item_0()
        {
            try
            {
                this.reward9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward9.autoRepeat = false;
            this.reward9.autoSize = "none";
            this.reward9.enabled = true;
            this.reward9.groupName = "";
            this.reward9.label = "";
            this.reward9.overlayAlign = "none";
            this.reward9.overlayImg = "";
            this.reward9.overlayPadding = {x:0, y:0};
            this.reward9.selected = false;
            this.reward9.toggle = false;
            this.reward9.usePrevLabel = false;
            this.reward9.visible = true;
            try
            {
                this.reward9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_reward10_ActivityPage_List_item_0()
        {
            try
            {
                this.reward10["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward10.autoRepeat = false;
            this.reward10.autoSize = "none";
            this.reward10.enabled = true;
            this.reward10.groupName = "";
            this.reward10.label = "";
            this.reward10.overlayAlign = "none";
            this.reward10.overlayImg = "";
            this.reward10.overlayPadding = {x:0, y:0};
            this.reward10.selected = false;
            this.reward10.toggle = false;
            this.reward10.usePrevLabel = false;
            this.reward10.visible = true;
            try
            {
                this.reward10["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_reward11_ActivityPage_List_item_0()
        {
            try
            {
                this.reward11["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward11.autoRepeat = false;
            this.reward11.autoSize = "none";
            this.reward11.enabled = true;
            this.reward11.groupName = "";
            this.reward11.label = "";
            this.reward11.overlayAlign = "none";
            this.reward11.overlayImg = "";
            this.reward11.overlayPadding = {x:0, y:0};
            this.reward11.selected = false;
            this.reward11.toggle = false;
            this.reward11.usePrevLabel = false;
            this.reward11.visible = true;
            try
            {
                this.reward11["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_reward12_ActivityPage_List_item_0()
        {
            try
            {
                this.reward12["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.reward12.autoRepeat = false;
            this.reward12.autoSize = "none";
            this.reward12.enabled = true;
            this.reward12.groupName = "";
            this.reward12.label = "";
            this.reward12.overlayAlign = "none";
            this.reward12.overlayImg = "";
            this.reward12.overlayPadding = {x:0, y:0};
            this.reward12.selected = false;
            this.reward12.toggle = false;
            this.reward12.usePrevLabel = false;
            this.reward12.visible = true;
            try
            {
                this.reward12["componentInspectorSetting"] = false;
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
