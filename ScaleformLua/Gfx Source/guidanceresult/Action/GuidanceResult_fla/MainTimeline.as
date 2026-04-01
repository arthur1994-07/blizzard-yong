package GuidanceResult_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var labelTitle1:Label;
        public var labelTitle2:Label;
        public var labelTitle3:Label;
        public var labelTitle4:Label;
        public var labelTitle5:Label;
        public var labelTitle6:Label;
        public var labelTitle7:Label;
        public var labelMine1:Label;
        public var labelMine2:Label;
        public var labelMine3:Label;
        public var labelMine4:Label;
        public var labelMine5:Label;
        public var labelMine6:Label;
        public var labelTime:Label;
        public var btnExit:Button;
        public var list:ScrollingList;
        public var scrollBar:ScrollBar;
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
        public var rtClubIconMine:MRenderTexture;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_Scene1_list_0();
            this.__setProp_scrollBar_Scene1_scrollbar_0();
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
            this.__setProp_labelTitle1_Scene1_layer1_0();
            this.__setProp_labelTitle3_Scene1_layer1_0();
            this.__setProp_labelTitle4_Scene1_layer1_0();
            this.__setProp_labelTitle5_Scene1_layer1_0();
            this.__setProp_labelTitle6_Scene1_layer1_0();
            this.__setProp_labelMine1_Scene1_layer1_0();
            this.__setProp_labelMine2_Scene1_layer1_0();
            this.__setProp_labelMine3_Scene1_layer1_0();
            this.__setProp_labelMine4_Scene1_layer1_0();
            this.__setProp_labelMine5_Scene1_layer1_0();
            this.__setProp_btnExit_Scene1_layer1_0();
            this.__setProp_labelTime_Scene1_layer1_0();
            this.__setProp_labelTitle2_Scene1_layer1_0();
            this.__setProp_labelMine6_Scene1_layer1_0();
            this.__setProp_labelTitle7_Scene1_layer1_0();
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

        function __setProp_scrollBar_Scene1_scrollbar_0()
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

        function __setProp_labelTitle1_Scene1_layer1_0()
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

        function __setProp_labelTitle3_Scene1_layer1_0()
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
            this.labelTitle3.text = "Club";
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

        function __setProp_labelTitle4_Scene1_layer1_0()
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
            this.labelTitle4.text = "Club Master";
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

        function __setProp_labelTitle5_Scene1_layer1_0()
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
            this.labelTitle5.text = "Points";
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

        function __setProp_labelTitle6_Scene1_layer1_0()
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
            this.labelTitle6.text = "Machine";
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

        function __setProp_labelMine1_Scene1_layer1_0()
        {
            try
            {
                this.labelMine1["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMine1.autoSize = "center";
            this.labelMine1.enabled = true;
            this.labelMine1.text = "";
            this.labelMine1.visible = true;
            try
            {
                this.labelMine1["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMine2_Scene1_layer1_0()
        {
            try
            {
                this.labelMine2["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMine2.autoSize = "center";
            this.labelMine2.enabled = true;
            this.labelMine2.text = "";
            this.labelMine2.visible = true;
            try
            {
                this.labelMine2["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMine3_Scene1_layer1_0()
        {
            try
            {
                this.labelMine3["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMine3.autoSize = "center";
            this.labelMine3.enabled = true;
            this.labelMine3.text = "";
            this.labelMine3.visible = true;
            try
            {
                this.labelMine3["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMine4_Scene1_layer1_0()
        {
            try
            {
                this.labelMine4["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMine4.autoSize = "center";
            this.labelMine4.enabled = true;
            this.labelMine4.text = "";
            this.labelMine4.visible = true;
            try
            {
                this.labelMine4["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMine5_Scene1_layer1_0()
        {
            try
            {
                this.labelMine5["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMine5.autoSize = "center";
            this.labelMine5.enabled = true;
            this.labelMine5.text = "";
            this.labelMine5.visible = true;
            try
            {
                this.labelMine5["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnExit_Scene1_layer1_0()
        {
            try
            {
                this.btnExit["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnExit.autoRepeat = false;
            this.btnExit.autoSize = "none";
            this.btnExit.enabled = true;
            this.btnExit.focusable = false;
            this.btnExit.groupName = "";
            this.btnExit.label = "";
            this.btnExit.overlayAlign = "none";
            this.btnExit.overlayImg = "";
            this.btnExit.overlayPadding = {x:0, y:0};
            this.btnExit.preventAutoSize = true;
            this.btnExit.selected = false;
            this.btnExit.toggle = false;
            this.btnExit.visible = true;
            try
            {
                this.btnExit["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTime_Scene1_layer1_0()
        {
            try
            {
                this.labelTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTime.autoSize = "center";
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

        function __setProp_labelTitle2_Scene1_layer1_0()
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
            this.labelTitle2.text = "Mark";
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

        function __setProp_labelMine6_Scene1_layer1_0()
        {
            try
            {
                this.labelMine6["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMine6.autoSize = "center";
            this.labelMine6.enabled = true;
            this.labelMine6.text = "";
            this.labelMine6.visible = true;
            try
            {
                this.labelMine6["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTitle7_Scene1_layer1_0()
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
            this.labelTitle7.text = "Certification";
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

        function frame1()
        {
            return;
        }// end function

    }
}
