package PrivateMarketSearch_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class tabLog_10 extends MovieClip
    {
        public var item5:LogListItemRenderer;
        public var item6:LogListItemRenderer;
        public var item7:LogListItemRenderer;
        public var item10:LogListItemRenderer;
        public var item8:LogListItemRenderer;
        public var item11:LogListItemRenderer;
        public var item9:LogListItemRenderer;
        public var item12:LogListItemRenderer;
        public var item13:LogListItemRenderer;
        public var item14:LogListItemRenderer;
        public var item15:LogListItemRenderer;
        public var item16:LogListItemRenderer;
        public var item17:LogListItemRenderer;
        public var item18:LogListItemRenderer;
        public var item1:LogListItemRenderer;
        public var item2:LogListItemRenderer;
        public var item3:LogListItemRenderer;
        public var item4:LogListItemRenderer;
        public var labelTitle:Label;
        public var labelDate:Label;
        public var labelTime:Label;
        public var labelSale:Label;
        public var labelItemName:Label;
        public var labelCount:Label;
        public var labelMoney:Label;
        public var labelCharName:Label;
        public var scrollBar:ScrollBar;
        public var list:ScrollingList;

        public function tabLog_10()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_tabLog_list_0();
            this.__setProp_scrollBar_tabLog_scroll_0();
            this.__setProp_labelTitle_tabLog_label_0();
            this.__setProp_labelDate_tabLog_label_0();
            this.__setProp_labelTime_tabLog_label_0();
            this.__setProp_labelSale_tabLog_label_0();
            this.__setProp_labelItemName_tabLog_label_0();
            this.__setProp_labelCount_tabLog_label_0();
            this.__setProp_labelMoney_tabLog_label_0();
            this.__setProp_labelCharName_tabLog_label_0();
            return;
        }// end function

        function __setProp_list_tabLog_list_0()
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

        function __setProp_scrollBar_tabLog_scroll_0()
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

        function __setProp_labelTitle_tabLog_label_0()
        {
            try
            {
                this.labelTitle["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTitle.autoSize = "center";
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

        function __setProp_labelDate_tabLog_label_0()
        {
            try
            {
                this.labelDate["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelDate.autoSize = "center";
            this.labelDate.enabled = true;
            this.labelDate.text = "";
            this.labelDate.visible = true;
            try
            {
                this.labelDate["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTime_tabLog_label_0()
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

        function __setProp_labelSale_tabLog_label_0()
        {
            try
            {
                this.labelSale["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelSale.autoSize = "center";
            this.labelSale.enabled = true;
            this.labelSale.text = "";
            this.labelSale.visible = true;
            try
            {
                this.labelSale["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelItemName_tabLog_label_0()
        {
            try
            {
                this.labelItemName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelItemName.autoSize = "center";
            this.labelItemName.enabled = true;
            this.labelItemName.text = "";
            this.labelItemName.visible = true;
            try
            {
                this.labelItemName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCount_tabLog_label_0()
        {
            try
            {
                this.labelCount["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCount.autoSize = "center";
            this.labelCount.enabled = true;
            this.labelCount.text = "";
            this.labelCount.visible = true;
            try
            {
                this.labelCount["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMoney_tabLog_label_0()
        {
            try
            {
                this.labelMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMoney.autoSize = "center";
            this.labelMoney.enabled = true;
            this.labelMoney.text = "";
            this.labelMoney.visible = true;
            try
            {
                this.labelMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCharName_tabLog_label_0()
        {
            try
            {
                this.labelCharName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCharName.autoSize = "center";
            this.labelCharName.enabled = true;
            this.labelCharName.text = "";
            this.labelCharName.visible = true;
            try
            {
                this.labelCharName["componentInspectorSetting"] = false;
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
