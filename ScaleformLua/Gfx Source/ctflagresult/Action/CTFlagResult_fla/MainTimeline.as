package CTFlagResult_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var MyResult:ResultListItemRenderer_me;
        public var mcReward:MovieClip;
        public var list:ScrollingList;
        public var scrollBar:ScrollBar;
        public var labelInfo:Label;
        public var labelTitle1:Label;
        public var labelTitle2:Label;
        public var labelTitle3:Label;
        public var labelTitle4:Label;
        public var labelTitle5:Label;
        public var labelTitle6:Label;
        public var labelTitle7:Label;
        public var labelTitle8:Label;
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
        public var btnOut:Button;
        public var btnHelp1:Button;
        public var btnHelp2:Button;
        public var btnHelp3:Button;
        public var btnHelp4:Button;
        public var btnHelp5:Button;
        public var btnHelp6:Button;
        public var btnHelp7:Button;
        public var btnHelp8:Button;
        public var btnHelp9:Button;
        public var btnHelp10:Button;
        public var btnHelp11:Button;
        public var btnHelp12:Button;
        public var btnHelp13:Button;
        public var btnHelp14:Button;
        public var btnHelp15:Button;
        public var btnHelp16:Button;
        public var MybtnHelp:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelInfo_Scene1_asset_0();
            this.__setProp_labelTitle1_Scene1_asset_0();
            this.__setProp_labelTitle2_Scene1_asset_0();
            this.__setProp_labelTitle3_Scene1_asset_0();
            this.__setProp_labelTitle4_Scene1_asset_0();
            this.__setProp_labelTitle5_Scene1_asset_0();
            this.__setProp_labelTitle6_Scene1_asset_0();
            this.__setProp_labelTitle7_Scene1_asset_0();
            this.__setProp_labelTitle8_Scene1_asset_0();
            this.__setProp_list_Scene1_list_0();
            this.__setProp_scrollBar_Scene1_scroll_0();
            this.__setProp_item1_Scene1_renderer_0();
            this.__setProp_item2_Scene1_renderer_0();
            this.__setProp_item3_Scene1_renderer_0();
            this.__setProp_item4_Scene1_renderer_0();
            this.__setProp_item5_Scene1_renderer_0();
            this.__setProp_item6_Scene1_renderer_0();
            this.__setProp_item7_Scene1_renderer_0();
            this.__setProp_item8_Scene1_renderer_0();
            this.__setProp_item9_Scene1_renderer_0();
            this.__setProp_item10_Scene1_renderer_0();
            this.__setProp_item11_Scene1_renderer_0();
            this.__setProp_item12_Scene1_renderer_0();
            this.__setProp_item13_Scene1_renderer_0();
            this.__setProp_item14_Scene1_renderer_0();
            this.__setProp_item15_Scene1_renderer_0();
            this.__setProp_item16_Scene1_renderer_0();
            this.__setProp_btnHelp1_Scene1_renderer_0();
            this.__setProp_btnHelp2_Scene1_renderer_0();
            this.__setProp_btnHelp3_Scene1_renderer_0();
            this.__setProp_btnHelp4_Scene1_renderer_0();
            this.__setProp_btnHelp7_Scene1_renderer_0();
            this.__setProp_btnHelp6_Scene1_renderer_0();
            this.__setProp_btnHelp5_Scene1_renderer_0();
            this.__setProp_btnHelp12_Scene1_renderer_0();
            this.__setProp_btnHelp11_Scene1_renderer_0();
            this.__setProp_btnHelp10_Scene1_renderer_0();
            this.__setProp_btnHelp9_Scene1_renderer_0();
            this.__setProp_btnHelp8_Scene1_renderer_0();
            this.__setProp_btnHelp13_Scene1_renderer_0();
            this.__setProp_btnHelp14_Scene1_renderer_0();
            this.__setProp_btnHelp15_Scene1_renderer_0();
            this.__setProp_btnHelp16_Scene1_renderer_0();
            this.__setProp_MybtnHelp_Scene1_renderer_0();
            return;
        }// end function

        function __setProp_labelInfo_Scene1_asset_0()
        {
            try
            {
                this.labelInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelInfo.autoSize = "center";
            this.labelInfo.enabled = true;
            this.labelInfo.text = "";
            this.labelInfo.visible = true;
            try
            {
                this.labelInfo["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTitle1_Scene1_asset_0()
        {
            try
            {
                this.labelTitle1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle1.autoSize = "center";
            this.labelTitle1.enabled = true;
            this.labelTitle1.text = "Rank";
            this.labelTitle1.visible = true;
            try
            {
                this.labelTitle1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTitle2_Scene1_asset_0()
        {
            try
            {
                this.labelTitle2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle2.autoSize = "center";
            this.labelTitle2.enabled = true;
            this.labelTitle2.text = "School";
            this.labelTitle2.visible = true;
            try
            {
                this.labelTitle2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTitle3_Scene1_asset_0()
        {
            try
            {
                this.labelTitle3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle3.autoSize = "center";
            this.labelTitle3.enabled = true;
            this.labelTitle3.text = "Class";
            this.labelTitle3.visible = true;
            try
            {
                this.labelTitle3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTitle4_Scene1_asset_0()
        {
            try
            {
                this.labelTitle4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle4.autoSize = "center";
            this.labelTitle4.enabled = true;
            this.labelTitle4.text = "Character Name";
            this.labelTitle4.visible = true;
            try
            {
                this.labelTitle4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTitle5_Scene1_asset_0()
        {
            try
            {
                this.labelTitle5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle5.autoSize = "center";
            this.labelTitle5.enabled = true;
            this.labelTitle5.text = "Point";
            this.labelTitle5.visible = true;
            try
            {
                this.labelTitle5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTitle6_Scene1_asset_0()
        {
            try
            {
                this.labelTitle6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle6.autoSize = "center";
            this.labelTitle6.enabled = true;
            this.labelTitle6.text = "Kill";
            this.labelTitle6.visible = true;
            try
            {
                this.labelTitle6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTitle7_Scene1_asset_0()
        {
            try
            {
                this.labelTitle7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle7.autoSize = "center";
            this.labelTitle7.enabled = true;
            this.labelTitle7.text = "Death";
            this.labelTitle7.visible = true;
            try
            {
                this.labelTitle7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTitle8_Scene1_asset_0()
        {
            try
            {
                this.labelTitle8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle8.autoSize = "center";
            this.labelTitle8.enabled = true;
            this.labelTitle8.text = "Reward";
            this.labelTitle8.visible = true;
            try
            {
                this.labelTitle8["componentInspectorSetting"] = false;
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

        function __setProp_item1_Scene1_renderer_0()
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

        function __setProp_item2_Scene1_renderer_0()
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

        function __setProp_item3_Scene1_renderer_0()
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

        function __setProp_item4_Scene1_renderer_0()
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

        function __setProp_item5_Scene1_renderer_0()
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

        function __setProp_item6_Scene1_renderer_0()
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

        function __setProp_item7_Scene1_renderer_0()
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

        function __setProp_item8_Scene1_renderer_0()
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

        function __setProp_item9_Scene1_renderer_0()
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

        function __setProp_item10_Scene1_renderer_0()
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

        function __setProp_item11_Scene1_renderer_0()
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

        function __setProp_item12_Scene1_renderer_0()
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

        function __setProp_item13_Scene1_renderer_0()
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

        function __setProp_item14_Scene1_renderer_0()
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

        function __setProp_item15_Scene1_renderer_0()
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

        function __setProp_item16_Scene1_renderer_0()
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

        function __setProp_btnHelp1_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp1.autoRepeat = false;
            this.btnHelp1.autoSize = "none";
            this.btnHelp1.enabled = true;
            this.btnHelp1.focusable = false;
            this.btnHelp1.groupName = "";
            this.btnHelp1.label = "?";
            this.btnHelp1.overlayAlign = "none";
            this.btnHelp1.overlayImg = "";
            this.btnHelp1.overlayPadding = {x:0, y:0};
            this.btnHelp1.preventAutoSize = false;
            this.btnHelp1.selected = false;
            this.btnHelp1.toggle = false;
            this.btnHelp1.visible = true;
            try
            {
                this.btnHelp1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp2_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp2.autoRepeat = false;
            this.btnHelp2.autoSize = "none";
            this.btnHelp2.enabled = true;
            this.btnHelp2.focusable = false;
            this.btnHelp2.groupName = "";
            this.btnHelp2.label = "?";
            this.btnHelp2.overlayAlign = "none";
            this.btnHelp2.overlayImg = "";
            this.btnHelp2.overlayPadding = {x:0, y:0};
            this.btnHelp2.preventAutoSize = false;
            this.btnHelp2.selected = false;
            this.btnHelp2.toggle = false;
            this.btnHelp2.visible = true;
            try
            {
                this.btnHelp2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp3_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp3.autoRepeat = false;
            this.btnHelp3.autoSize = "none";
            this.btnHelp3.enabled = true;
            this.btnHelp3.focusable = false;
            this.btnHelp3.groupName = "";
            this.btnHelp3.label = "?";
            this.btnHelp3.overlayAlign = "none";
            this.btnHelp3.overlayImg = "";
            this.btnHelp3.overlayPadding = {x:0, y:0};
            this.btnHelp3.preventAutoSize = false;
            this.btnHelp3.selected = false;
            this.btnHelp3.toggle = false;
            this.btnHelp3.visible = true;
            try
            {
                this.btnHelp3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp4_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp4.autoRepeat = false;
            this.btnHelp4.autoSize = "none";
            this.btnHelp4.enabled = true;
            this.btnHelp4.focusable = false;
            this.btnHelp4.groupName = "";
            this.btnHelp4.label = "?";
            this.btnHelp4.overlayAlign = "none";
            this.btnHelp4.overlayImg = "";
            this.btnHelp4.overlayPadding = {x:0, y:0};
            this.btnHelp4.preventAutoSize = false;
            this.btnHelp4.selected = false;
            this.btnHelp4.toggle = false;
            this.btnHelp4.visible = true;
            try
            {
                this.btnHelp4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp7_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp7["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp7.autoRepeat = false;
            this.btnHelp7.autoSize = "none";
            this.btnHelp7.enabled = true;
            this.btnHelp7.focusable = false;
            this.btnHelp7.groupName = "";
            this.btnHelp7.label = "?";
            this.btnHelp7.overlayAlign = "none";
            this.btnHelp7.overlayImg = "";
            this.btnHelp7.overlayPadding = {x:0, y:0};
            this.btnHelp7.preventAutoSize = false;
            this.btnHelp7.selected = false;
            this.btnHelp7.toggle = false;
            this.btnHelp7.visible = true;
            try
            {
                this.btnHelp7["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp6_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp6.autoRepeat = false;
            this.btnHelp6.autoSize = "none";
            this.btnHelp6.enabled = true;
            this.btnHelp6.focusable = true;
            this.btnHelp6.groupName = "";
            this.btnHelp6.label = "?";
            this.btnHelp6.overlayAlign = "none";
            this.btnHelp6.overlayImg = "";
            this.btnHelp6.overlayPadding = {x:0, y:0};
            this.btnHelp6.preventAutoSize = false;
            this.btnHelp6.selected = false;
            this.btnHelp6.toggle = false;
            this.btnHelp6.visible = true;
            try
            {
                this.btnHelp6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp5_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp5.autoRepeat = false;
            this.btnHelp5.autoSize = "none";
            this.btnHelp5.enabled = true;
            this.btnHelp5.focusable = false;
            this.btnHelp5.groupName = "";
            this.btnHelp5.label = "?";
            this.btnHelp5.overlayAlign = "none";
            this.btnHelp5.overlayImg = "";
            this.btnHelp5.overlayPadding = {x:0, y:0};
            this.btnHelp5.preventAutoSize = false;
            this.btnHelp5.selected = false;
            this.btnHelp5.toggle = false;
            this.btnHelp5.visible = true;
            try
            {
                this.btnHelp5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp12_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp12["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp12.autoRepeat = false;
            this.btnHelp12.autoSize = "none";
            this.btnHelp12.enabled = true;
            this.btnHelp12.focusable = false;
            this.btnHelp12.groupName = "";
            this.btnHelp12.label = "?";
            this.btnHelp12.overlayAlign = "none";
            this.btnHelp12.overlayImg = "";
            this.btnHelp12.overlayPadding = {x:0, y:0};
            this.btnHelp12.preventAutoSize = false;
            this.btnHelp12.selected = false;
            this.btnHelp12.toggle = false;
            this.btnHelp12.visible = true;
            try
            {
                this.btnHelp12["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp11_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp11["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp11.autoRepeat = false;
            this.btnHelp11.autoSize = "none";
            this.btnHelp11.enabled = true;
            this.btnHelp11.focusable = false;
            this.btnHelp11.groupName = "";
            this.btnHelp11.label = "?";
            this.btnHelp11.overlayAlign = "none";
            this.btnHelp11.overlayImg = "";
            this.btnHelp11.overlayPadding = {x:0, y:0};
            this.btnHelp11.preventAutoSize = false;
            this.btnHelp11.selected = false;
            this.btnHelp11.toggle = false;
            this.btnHelp11.visible = true;
            try
            {
                this.btnHelp11["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp10_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp10["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp10.autoRepeat = false;
            this.btnHelp10.autoSize = "none";
            this.btnHelp10.enabled = true;
            this.btnHelp10.focusable = false;
            this.btnHelp10.groupName = "";
            this.btnHelp10.label = "?";
            this.btnHelp10.overlayAlign = "none";
            this.btnHelp10.overlayImg = "";
            this.btnHelp10.overlayPadding = {x:0, y:0};
            this.btnHelp10.preventAutoSize = false;
            this.btnHelp10.selected = false;
            this.btnHelp10.toggle = false;
            this.btnHelp10.visible = true;
            try
            {
                this.btnHelp10["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp9_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp9["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp9.autoRepeat = false;
            this.btnHelp9.autoSize = "none";
            this.btnHelp9.enabled = true;
            this.btnHelp9.focusable = false;
            this.btnHelp9.groupName = "";
            this.btnHelp9.label = "?";
            this.btnHelp9.overlayAlign = "none";
            this.btnHelp9.overlayImg = "";
            this.btnHelp9.overlayPadding = {x:0, y:0};
            this.btnHelp9.preventAutoSize = false;
            this.btnHelp9.selected = false;
            this.btnHelp9.toggle = false;
            this.btnHelp9.visible = true;
            try
            {
                this.btnHelp9["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp8_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp8["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp8.autoRepeat = false;
            this.btnHelp8.autoSize = "none";
            this.btnHelp8.enabled = true;
            this.btnHelp8.focusable = false;
            this.btnHelp8.groupName = "";
            this.btnHelp8.label = "?";
            this.btnHelp8.overlayAlign = "none";
            this.btnHelp8.overlayImg = "";
            this.btnHelp8.overlayPadding = {x:0, y:0};
            this.btnHelp8.preventAutoSize = false;
            this.btnHelp8.selected = false;
            this.btnHelp8.toggle = false;
            this.btnHelp8.visible = true;
            try
            {
                this.btnHelp8["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp13_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp13["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp13.autoRepeat = false;
            this.btnHelp13.autoSize = "none";
            this.btnHelp13.enabled = true;
            this.btnHelp13.focusable = false;
            this.btnHelp13.groupName = "";
            this.btnHelp13.label = "?";
            this.btnHelp13.overlayAlign = "none";
            this.btnHelp13.overlayImg = "";
            this.btnHelp13.overlayPadding = {x:0, y:0};
            this.btnHelp13.preventAutoSize = false;
            this.btnHelp13.selected = false;
            this.btnHelp13.toggle = false;
            this.btnHelp13.visible = true;
            try
            {
                this.btnHelp13["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp14_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp14["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp14.autoRepeat = false;
            this.btnHelp14.autoSize = "none";
            this.btnHelp14.enabled = true;
            this.btnHelp14.focusable = false;
            this.btnHelp14.groupName = "";
            this.btnHelp14.label = "?";
            this.btnHelp14.overlayAlign = "none";
            this.btnHelp14.overlayImg = "";
            this.btnHelp14.overlayPadding = {x:0, y:0};
            this.btnHelp14.preventAutoSize = false;
            this.btnHelp14.selected = false;
            this.btnHelp14.toggle = false;
            this.btnHelp14.visible = true;
            try
            {
                this.btnHelp14["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp15_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp15["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp15.autoRepeat = false;
            this.btnHelp15.autoSize = "none";
            this.btnHelp15.enabled = true;
            this.btnHelp15.focusable = false;
            this.btnHelp15.groupName = "";
            this.btnHelp15.label = "?";
            this.btnHelp15.overlayAlign = "none";
            this.btnHelp15.overlayImg = "";
            this.btnHelp15.overlayPadding = {x:0, y:0};
            this.btnHelp15.preventAutoSize = false;
            this.btnHelp15.selected = false;
            this.btnHelp15.toggle = false;
            this.btnHelp15.visible = true;
            try
            {
                this.btnHelp15["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnHelp16_Scene1_renderer_0()
        {
            try
            {
                this.btnHelp16["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnHelp16.autoRepeat = false;
            this.btnHelp16.autoSize = "none";
            this.btnHelp16.enabled = true;
            this.btnHelp16.focusable = false;
            this.btnHelp16.groupName = "";
            this.btnHelp16.label = "?";
            this.btnHelp16.overlayAlign = "none";
            this.btnHelp16.overlayImg = "";
            this.btnHelp16.overlayPadding = {x:0, y:0};
            this.btnHelp16.preventAutoSize = false;
            this.btnHelp16.selected = false;
            this.btnHelp16.toggle = false;
            this.btnHelp16.visible = true;
            try
            {
                this.btnHelp16["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_MybtnHelp_Scene1_renderer_0()
        {
            try
            {
                this.MybtnHelp["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.MybtnHelp.autoRepeat = false;
            this.MybtnHelp.autoSize = "none";
            this.MybtnHelp.enabled = true;
            this.MybtnHelp.focusable = false;
            this.MybtnHelp.groupName = "";
            this.MybtnHelp.label = "?";
            this.MybtnHelp.overlayAlign = "none";
            this.MybtnHelp.overlayImg = "";
            this.MybtnHelp.overlayPadding = {x:0, y:0};
            this.MybtnHelp.preventAutoSize = false;
            this.MybtnHelp.selected = false;
            this.MybtnHelp.toggle = false;
            this.MybtnHelp.visible = true;
            try
            {
                this.MybtnHelp["componentInspectorSetting"] = false;
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
