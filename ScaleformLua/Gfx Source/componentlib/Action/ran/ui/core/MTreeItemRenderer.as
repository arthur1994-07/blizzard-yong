package ran.ui.core
{
    import flash.text.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.data.*;

    public class MTreeItemRenderer extends ListItemRenderer
    {
        protected var _dataProvider:DataProvider = null;
        protected var _expanded:Boolean = false;
        protected var _checked:Boolean = false;
        protected var textMargin:int = 0;

        public function MTreeItemRenderer()
        {
            validateNow();
            return;
        }// end function

        public function set dataProvider(param1:DataProvider) : void
        {
            this._dataProvider = param1;
            return;
        }// end function

        public function get dataProvider() : DataProvider
        {
            return this._dataProvider;
        }// end function

        override public function get expanded() : Boolean
        {
            return this._expanded;
        }// end function

        override public function set expanded(param1:Boolean) : void
        {
            this._expanded = param1;
            return;
        }// end function

        override public function get checked() : Boolean
        {
            return this._checked;
        }// end function

        override public function set checked(param1:Boolean) : void
        {
            this._checked = param1;
            return;
        }// end function

        override protected function draw() : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            super.draw();
            var _loc_1:* = 0;
            while (_loc_1 < this.numChildren)
            {
                
                _loc_2 = this.getChildAt(_loc_1);
                if (_loc_2 is TextField)
                {
                    _loc_3 = _loc_2.getTextFormat();
                    _loc_3.leftMargin = this.textMargin;
                    _loc_2.setTextFormat(_loc_3);
                }
                _loc_1++;
            }
            return;
        }// end function

        override public function setListData(param1:ListData) : void
        {
            index = param1.index;
            selected = param1.selected;
            _arrLabel = param1.label;
            invalidateData();
            return;
        }// end function

        override public function setData(param1:Object) : void
        {
            super.setData(param1);
            if (param1 == null)
            {
                return;
            }
            if (param1.leaf != 0)
            {
                this.dataProvider = new DataProvider(param1.leaf);
                if (undefined == param1.expanded)
                {
                    param1.expanded = false;
                }
                else if (typeof(param1.expanded) == "string")
                {
                    param1.expanded = param1.expanded == "0" ? (false) : (true);
                }
                this.expanded = param1.expanded;
            }
            else
            {
                this.dataProvider = null;
                this.expanded = false;
            }
            if (undefined == param1.checked)
            {
                param1.checked = false;
            }
            else if (typeof(param1.checked) == "string")
            {
                param1.checked = param1.checked == "0" ? (false) : (true);
            }
            this.checked = param1.checked;
            return;
        }// end function

        override public function setLabelOffsetX(param1:int) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            this.textMargin = param1;
            var _loc_2:* = 0;
            while (_loc_2 < this.numChildren)
            {
                
                _loc_3 = this.getChildAt(_loc_2);
                if (_loc_3 is TextField)
                {
                    _loc_4 = _loc_3.getTextFormat();
                    _loc_4.leftMargin = this.textMargin;
                    _loc_3.setTextFormat(_loc_4);
                }
                _loc_2++;
            }
            return;
        }// end function

        override public function getLeafDataProvider() : DataProvider
        {
            return this.dataProvider;
        }// end function

        override public function toString() : String
        {
            return "[CLIK MTreeItemRenderer " + index + ", " + name + "]";
        }// end function

    }
}
