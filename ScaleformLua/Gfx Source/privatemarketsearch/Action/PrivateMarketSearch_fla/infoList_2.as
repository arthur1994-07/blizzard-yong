package PrivateMarketSearch_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class infoList_2 extends MovieClip
    {
        public var item5:PMSListItemRederer;
        public var item6:PMSListItemRederer;
        public var item7:PMSListItemRederer;
        public var item8:PMSListItemRederer;
        public var header:MovieClip;
        public var info1:MovieClip;
        public var info2:MovieClip;
        public var info3:MovieClip;
        public var info4:MovieClip;
        public var info5:MovieClip;
        public var info6:MovieClip;
        public var info7:MovieClip;
        public var item1:PMSListItemRederer;
        public var info8:MovieClip;
        public var item2:PMSListItemRederer;
        public var item3:PMSListItemRederer;
        public var item4:PMSListItemRederer;
        public var btnPrev:Button;
        public var btnNext:Button;
        public var scrollBar:ScrollBar;
        public var list:ScrollingList;
        public var inputPage:TextInput;
        public var labelPer:Label;
        public var labelMaxPage:Label;

        public function infoList_2()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_infoList_list_0();
            this.__setProp_item1_infoList_item_0();
            this.__setProp_item2_infoList_item_0();
            this.__setProp_item3_infoList_item_0();
            this.__setProp_item4_infoList_item_0();
            this.__setProp_item5_infoList_item_0();
            this.__setProp_item6_infoList_item_0();
            this.__setProp_item7_infoList_item_0();
            this.__setProp_item8_infoList_item_0();
            this.__setProp_scrollBar_infoList_scroll_0();
            this.__setProp_btnNext_infoList_btn_0();
            this.__setProp_btnPrev_infoList_btn_0();
            this.__setProp_inputPage_infoList_btn_0();
            this.__setProp_labelPer_infoList_btn_0();
            this.__setProp_labelMaxPage_infoList_btn_0();
            return;
        }// end function

        function __setProp_list_infoList_list_0()
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

        function __setProp_item1_infoList_item_0()
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
            this.item1.toggle = true;
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

        function __setProp_item2_infoList_item_0()
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
            this.item2.toggle = true;
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

        function __setProp_item3_infoList_item_0()
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
            this.item3.toggle = true;
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

        function __setProp_item4_infoList_item_0()
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
            this.item4.toggle = true;
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

        function __setProp_item5_infoList_item_0()
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
            this.item5.toggle = true;
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

        function __setProp_item6_infoList_item_0()
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
            this.item6.toggle = true;
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

        function __setProp_item7_infoList_item_0()
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
            this.item7.toggle = true;
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

        function __setProp_item8_infoList_item_0()
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
            this.item8.toggle = true;
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

        function __setProp_scrollBar_infoList_scroll_0()
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

        function __setProp_btnNext_infoList_btn_0()
        {
            try
            {
                this.btnNext["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnNext.autoRepeat = false;
            this.btnNext.autoSize = "none";
            this.btnNext.enabled = true;
            this.btnNext.focusable = false;
            this.btnNext.groupName = "";
            this.btnNext.label = "";
            this.btnNext.overlayAlign = "none";
            this.btnNext.overlayImg = "";
            this.btnNext.overlayPadding = {x:0, y:0};
            this.btnNext.selected = false;
            this.btnNext.toggle = false;
            this.btnNext.visible = true;
            try
            {
                this.btnNext["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnPrev_infoList_btn_0()
        {
            try
            {
                this.btnPrev["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnPrev.autoRepeat = false;
            this.btnPrev.autoSize = "none";
            this.btnPrev.enabled = true;
            this.btnPrev.focusable = false;
            this.btnPrev.groupName = "";
            this.btnPrev.label = "";
            this.btnPrev.overlayAlign = "none";
            this.btnPrev.overlayImg = "";
            this.btnPrev.overlayPadding = {x:0, y:0};
            this.btnPrev.selected = false;
            this.btnPrev.toggle = false;
            this.btnPrev.visible = true;
            try
            {
                this.btnPrev["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_inputPage_infoList_btn_0()
        {
            try
            {
                this.inputPage["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.inputPage.defaultText = "";
            this.inputPage.displayAsPassword = false;
            this.inputPage.editable = true;
            this.inputPage.enabled = true;
            this.inputPage.focusable = true;
            this.inputPage.maxByte = 0;
            this.inputPage.maxChars = 0;
            this.inputPage.OnlyNumber = false;
            this.inputPage.Restrict = "number";
            this.inputPage.RestrictAddOn = "";
            this.inputPage.text = "";
            this.inputPage.textAlign = "left";
            this.inputPage.visible = true;
            try
            {
                this.inputPage["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelPer_infoList_btn_0()
        {
            try
            {
                this.labelPer["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelPer.autoSize = "center";
            this.labelPer.enabled = true;
            this.labelPer.text = "/";
            this.labelPer.visible = true;
            try
            {
                this.labelPer["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMaxPage_infoList_btn_0()
        {
            try
            {
                this.labelMaxPage["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMaxPage.autoSize = "left";
            this.labelMaxPage.enabled = true;
            this.labelMaxPage.text = "99999";
            this.labelMaxPage.visible = true;
            try
            {
                this.labelMaxPage["componentInspectorSetting"] = false;
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
