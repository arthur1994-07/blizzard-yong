package PrivateMarketSearch_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class tabCart_8 extends MovieClip
    {
        public var item5:CasherListItemRenderer;
        public var item6:CasherListItemRenderer;
        public var item7:CasherListItemRenderer;
        public var item10:CasherListItemRenderer;
        public var item8:CasherListItemRenderer;
        public var item11:CasherListItemRenderer;
        public var item9:CasherListItemRenderer;
        public var item12:CasherListItemRenderer;
        public var item13:CasherListItemRenderer;
        public var infoList:MovieClip;
        public var item1:CasherListItemRenderer;
        public var item2:CasherListItemRenderer;
        public var item3:CasherListItemRenderer;
        public var item4:CasherListItemRenderer;
        public var labelTitle:Label;
        public var labelCasher:Label;
        public var labelTotalPointStatic:Label;
        public var labelTotalPoint:Label;
        public var labelMyPointStatic:Label;
        public var labelMyPoint:Label;
        public var labelCalcPointStatic:Label;
        public var labelCalcPoint:Label;
        public var labelTotalMoneyStatic:Label;
        public var labelTotalMoney:Label;
        public var labelMyMoneyStatic:Label;
        public var labelMyMoney:Label;
        public var labelCalcMoneyStatic:Label;
        public var labelCalcMoney:Label;
        public var btnAllSelect:Button;
        public var btnDelete:Button;
        public var btnBuy:Button;
        public var scrollBar:ScrollBar;
        public var listCasher:ScrollingList;

        public function tabCart_8()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelTitle_tabCart_label_0();
            this.__setProp_labelCalcPoint_tabCart_label_0();
            this.__setProp_labelTotalMoney_tabCart_label_0();
            this.__setProp_labelTotalPoint_tabCart_label_0();
            this.__setProp_labelMyPoint_tabCart_label_0();
            this.__setProp_labelMyMoney_tabCart_label_0();
            this.__setProp_labelCalcMoney_tabCart_label_0();
            this.__setProp_labelTotalPointStatic_tabCart_label_0();
            this.__setProp_labelMyPointStatic_tabCart_label_0();
            this.__setProp_labelCalcPointStatic_tabCart_label_0();
            this.__setProp_labelTotalMoneyStatic_tabCart_label_0();
            this.__setProp_labelMyMoneyStatic_tabCart_label_0();
            this.__setProp_labelCalcMoneyStatic_tabCart_label_0();
            this.__setProp_labelCasher_tabCart_label_0();
            this.__setProp_listCasher_tabCart_list_0();
            this.__setProp_scrollBar_tabCart_scroll_0();
            this.__setProp_btnBuy_tabCart_btn_0();
            this.__setProp_btnDelete_tabCart_btn_0();
            this.__setProp_btnAllSelect_tabCart_btn_0();
            return;
        }// end function

        function __setProp_labelTitle_tabCart_label_0()
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

        function __setProp_labelCalcPoint_tabCart_label_0()
        {
            try
            {
                this.labelCalcPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCalcPoint.autoSize = "left";
            this.labelCalcPoint.enabled = true;
            this.labelCalcPoint.text = "";
            this.labelCalcPoint.visible = true;
            try
            {
                this.labelCalcPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTotalMoney_tabCart_label_0()
        {
            try
            {
                this.labelTotalMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTotalMoney.autoSize = "left";
            this.labelTotalMoney.enabled = true;
            this.labelTotalMoney.text = "";
            this.labelTotalMoney.visible = true;
            try
            {
                this.labelTotalMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTotalPoint_tabCart_label_0()
        {
            try
            {
                this.labelTotalPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTotalPoint.autoSize = "left";
            this.labelTotalPoint.enabled = true;
            this.labelTotalPoint.text = "";
            this.labelTotalPoint.visible = true;
            try
            {
                this.labelTotalPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMyPoint_tabCart_label_0()
        {
            try
            {
                this.labelMyPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMyPoint.autoSize = "left";
            this.labelMyPoint.enabled = true;
            this.labelMyPoint.text = "";
            this.labelMyPoint.visible = true;
            try
            {
                this.labelMyPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMyMoney_tabCart_label_0()
        {
            try
            {
                this.labelMyMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMyMoney.autoSize = "left";
            this.labelMyMoney.enabled = true;
            this.labelMyMoney.text = "";
            this.labelMyMoney.visible = true;
            try
            {
                this.labelMyMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCalcMoney_tabCart_label_0()
        {
            try
            {
                this.labelCalcMoney["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCalcMoney.autoSize = "left";
            this.labelCalcMoney.enabled = true;
            this.labelCalcMoney.text = "";
            this.labelCalcMoney.visible = true;
            try
            {
                this.labelCalcMoney["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTotalPointStatic_tabCart_label_0()
        {
            try
            {
                this.labelTotalPointStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTotalPointStatic.autoSize = "left";
            this.labelTotalPointStatic.enabled = true;
            this.labelTotalPointStatic.text = "";
            this.labelTotalPointStatic.visible = true;
            try
            {
                this.labelTotalPointStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMyPointStatic_tabCart_label_0()
        {
            try
            {
                this.labelMyPointStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMyPointStatic.autoSize = "left";
            this.labelMyPointStatic.enabled = true;
            this.labelMyPointStatic.text = "";
            this.labelMyPointStatic.visible = true;
            try
            {
                this.labelMyPointStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCalcPointStatic_tabCart_label_0()
        {
            try
            {
                this.labelCalcPointStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCalcPointStatic.autoSize = "left";
            this.labelCalcPointStatic.enabled = true;
            this.labelCalcPointStatic.text = "";
            this.labelCalcPointStatic.visible = true;
            try
            {
                this.labelCalcPointStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTotalMoneyStatic_tabCart_label_0()
        {
            try
            {
                this.labelTotalMoneyStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTotalMoneyStatic.autoSize = "left";
            this.labelTotalMoneyStatic.enabled = true;
            this.labelTotalMoneyStatic.text = "";
            this.labelTotalMoneyStatic.visible = true;
            try
            {
                this.labelTotalMoneyStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMyMoneyStatic_tabCart_label_0()
        {
            try
            {
                this.labelMyMoneyStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMyMoneyStatic.autoSize = "left";
            this.labelMyMoneyStatic.enabled = true;
            this.labelMyMoneyStatic.text = "";
            this.labelMyMoneyStatic.visible = true;
            try
            {
                this.labelMyMoneyStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCalcMoneyStatic_tabCart_label_0()
        {
            try
            {
                this.labelCalcMoneyStatic["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCalcMoneyStatic.autoSize = "left";
            this.labelCalcMoneyStatic.enabled = true;
            this.labelCalcMoneyStatic.text = "";
            this.labelCalcMoneyStatic.visible = true;
            try
            {
                this.labelCalcMoneyStatic["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCasher_tabCart_label_0()
        {
            try
            {
                this.labelCasher["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCasher.autoSize = "center";
            this.labelCasher.enabled = true;
            this.labelCasher.text = "";
            this.labelCasher.visible = true;
            try
            {
                this.labelCasher["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_listCasher_tabCart_list_0()
        {
            try
            {
                this.listCasher["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listCasher.enabled = true;
            this.listCasher.focusable = false;
            this.listCasher.itemRendererName = "";
            this.listCasher.itemRendererInstanceName = "item";
            this.listCasher.margin = 0;
            this.listCasher.multiSelect = false;
            this.listCasher.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listCasher.rowHeight = 0;
            this.listCasher.scrollBar = "";
            this.listCasher.treeButtonClassName = "";
            this.listCasher.treeButtonGap = -1;
            this.listCasher.treeCheckBoxClassName = "";
            this.listCasher.treeList = false;
            this.listCasher.visible = true;
            this.listCasher.wrapping = "normal";
            try
            {
                this.listCasher["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scrollBar_tabCart_scroll_0()
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

        function __setProp_btnBuy_tabCart_btn_0()
        {
            try
            {
                this.btnBuy["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnBuy.autoRepeat = false;
            this.btnBuy.autoSize = "none";
            this.btnBuy.enabled = true;
            this.btnBuy.focusable = false;
            this.btnBuy.groupName = "";
            this.btnBuy.label = "";
            this.btnBuy.overlayAlign = "none";
            this.btnBuy.overlayImg = "";
            this.btnBuy.overlayPadding = {x:0, y:0};
            this.btnBuy.selected = false;
            this.btnBuy.toggle = false;
            this.btnBuy.visible = true;
            try
            {
                this.btnBuy["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnDelete_tabCart_btn_0()
        {
            try
            {
                this.btnDelete["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnDelete.autoRepeat = false;
            this.btnDelete.autoSize = "none";
            this.btnDelete.enabled = true;
            this.btnDelete.focusable = false;
            this.btnDelete.groupName = "";
            this.btnDelete.label = " ";
            this.btnDelete.overlayAlign = "vertical & horizontal";
            this.btnDelete.overlayImg = "icon_trash";
            this.btnDelete.overlayPadding = {x:0, y:0};
            this.btnDelete.selected = false;
            this.btnDelete.toggle = false;
            this.btnDelete.visible = true;
            try
            {
                this.btnDelete["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnAllSelect_tabCart_btn_0()
        {
            try
            {
                this.btnAllSelect["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnAllSelect.autoRepeat = false;
            this.btnAllSelect.autoSize = "none";
            this.btnAllSelect.enabled = true;
            this.btnAllSelect.focusable = false;
            this.btnAllSelect.groupName = "";
            this.btnAllSelect.label = "";
            this.btnAllSelect.overlayAlign = "none";
            this.btnAllSelect.overlayImg = "";
            this.btnAllSelect.overlayPadding = {x:0, y:0};
            this.btnAllSelect.selected = false;
            this.btnAllSelect.toggle = false;
            this.btnAllSelect.visible = true;
            try
            {
                this.btnAllSelect["componentInspectorSetting"] = false;
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
