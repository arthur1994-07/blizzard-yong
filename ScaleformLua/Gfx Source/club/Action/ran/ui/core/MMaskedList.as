package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import flash.utils.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.gfx.*;

    public class MMaskedList extends MMaskedView
    {
        protected var itemRendererClass:Class;
        protected var _dataProvider:IDataProvider;
        protected var _itemRendererName:String = "";
        public var itemRendererOffset:Object;
        public var multiSelectable:Boolean = false;
        public var rowCount:int = 1;
        public var arrSelectedIndex:Array;
        protected var mapCreatedItemRenderer:Dictionary;

        public function MMaskedList()
        {
            this.arrSelectedIndex = new Array();
            this.mapCreatedItemRenderer = new Dictionary();
            return;
        }// end function

        public function invalidateRenderer() : void
        {
            invalidate(InvalidationType.RENDERERS);
            return;
        }// end function

        public function get dataProvider() : IDataProvider
        {
            return this._dataProvider;
        }// end function

        public function set dataProvider(param1:IDataProvider) : void
        {
            if (this._dataProvider == param1)
            {
                return;
            }
            this._dataProvider = param1;
            if (this._dataProvider == null)
            {
                return;
            }
            invalidateData();
            validateNow();
            return;
        }// end function

        public function get itemRendererName() : String
        {
            return this._itemRendererName;
        }// end function

        public function set itemRendererName(param1:String) : void
        {
            this._itemRendererName = param1;
            if (this._itemRendererName == "")
            {
                return;
            }
            var _loc_2:* = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null)
            {
                _loc_2 = loaderInfo.applicationDomain;
            }
            this.itemRendererClass = _loc_2.getDefinition(this._itemRendererName) as Class;
            return;
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.SIZE) == true)
            {
                this.updateSize();
            }
            if (isInvalid(InvalidationType.DATA) == true)
            {
                this.updateData();
            }
            return;
        }// end function

        protected function updateData() : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            while (mcItemRenderer.numChildren != 0)
            {
                
                mcItemRenderer.removeChildAt(0);
            }
            if (this._dataProvider == null || this.itemRendererClass == null)
            {
                return;
            }
            var _loc_1:* = 0;
            _loc_1 = 0;
            while (_loc_1 < this._dataProvider.length)
            {
                
                _loc_2 = "item" + _loc_1;
                _loc_3 = this.mapCreatedItemRenderer[_loc_2];
                if (_loc_3 == null)
                {
                    _loc_3 = new this.itemRendererClass() as MMaskedListItemRenderer;
                    if (_loc_3 == null)
                    {
                        trace("Renderer class could not be created.");
                        break;
                    }
                    this.mapCreatedItemRenderer[_loc_2] = _loc_3;
                    _loc_3.name = "item" + _loc_1;
                    _loc_3.width = Math.ceil(_loc_3.width / this.scaleX);
                    _loc_3.height = Math.ceil(_loc_3.height / this.scaleY);
                }
                _loc_3.x = Math.floor(_loc_1 % this.rowCount) * (_loc_3.width + this.itemRendererOffset.x);
                _loc_3.y = Math.floor(_loc_1 / this.rowCount) * (_loc_3.height + this.itemRendererOffset.y);
                _loc_3.index = _loc_1;
                _loc_3.data = this._dataProvider[_loc_1];
                _loc_3.doubleClickEnabled = true;
                _loc_3.addEventListener(MouseEvent.CLICK, this.onSelect, false, 0, true);
                _loc_3.addEventListener(MouseEvent.DOUBLE_CLICK, this.onDoubleClick, false, 0, true);
                mcItemRenderer.addChild(_loc_3);
                _loc_1++;
            }
            if (realHeight > mcItemRenderer.y + mcItemRenderer.height)
            {
                mcItemRenderer.y = mcItemRenderer.height * -1 + realHeight;
            }
            if (mcItemRenderer.y > 0)
            {
                mcItemRenderer.y = 0;
            }
            scrollBar.updateThumb();
            scrollBar.syncScroll();
            return;
        }// end function

        protected function updateSize() : void
        {
            var _loc_1:* = mask as MovieClip;
            _loc_1.graphics.beginFill(16777215);
            _loc_1.graphics.drawRect(0, 0, _realWidth, _realHeight);
            _loc_1.graphics.endFill();
            mask = _loc_1;
            if (scrollBar != null)
            {
                scrollBar.x = _realWidth - scrollBar.width;
                scrollBar.y = 0;
                scrollBar.width = scrollBar.width / this.scaleX;
                scrollBar.height = _realHeight;
            }
            invalidateData();
            return;
        }// end function

        override public function updateText() : void
        {
            var _loc_2:* = null;
            var _loc_1:* = 0;
            while (_loc_1 < mcItemRenderer.numChildren)
            {
                
                _loc_2 = mcItemRenderer.getChildAt(_loc_1) as MMaskedListItemRenderer;
                if (_loc_2 == null)
                {
                    break;
                }
                _loc_2.updateText();
                _loc_1++;
            }
            return;
        }// end function

        public function Select(param1:int) : void
        {
            var _loc_4:* = null;
            var _loc_2:* = null;
            var _loc_3:* = 0;
            if (this.multiSelectable == false)
            {
                this.arrSelectedIndex = [];
                if (param1 != -1)
                {
                    this.arrSelectedIndex.push(param1);
                }
                _loc_3 = 0;
                while (_loc_3 < mcItemRenderer.numChildren)
                {
                    
                    _loc_4 = mcItemRenderer.getChildAt(_loc_3) as MMaskedListItemRenderer;
                    _loc_4.setState(_loc_3 == param1);
                    if (_loc_3 == param1)
                    {
                        _loc_2 = _loc_4;
                    }
                    _loc_3++;
                }
            }
            if (_loc_2 == null)
            {
                return;
            }
            dispatchEvent(new ListEvent(ListEvent.INDEX_CHANGE, false, true, _loc_2.index, -1, -1, null, _loc_2.data, 0, 0, false));
            return;
        }// end function

        public function SelectClear() : void
        {
            var _loc_2:* = null;
            var _loc_1:* = 0;
            _loc_1 = 0;
            while (_loc_1 < mcItemRenderer.numChildren)
            {
                
                _loc_2 = mcItemRenderer.getChildAt(_loc_1) as MMaskedListItemRenderer;
                _loc_2.setState(false);
                _loc_1++;
            }
            dispatchEvent(new ListEvent(ListEvent.INDEX_CHANGE, false, true, -1, -1, -1, null, 0, 0, 0, false));
            this.arrSelectedIndex = [];
            return;
        }// end function

        public function ScrollToSelect() : void
        {
            if (this.arrSelectedIndex.length == 0)
            {
                return;
            }
            if (mcItemRenderer.height <= realHeight)
            {
                return;
            }
            var _loc_1:* = mcItemRenderer.getChildAt(this.arrSelectedIndex[0]) as MMaskedListItemRenderer;
            var _loc_2:* = _loc_1.y * -1;
            if (_loc_2 > 0)
            {
                _loc_2 = 0;
            }
            else if (realHeight > _loc_2 + mcItemRenderer.height)
            {
                _loc_2 = mcItemRenderer.height * -1 + realHeight;
            }
            mcItemRenderer.y = _loc_2;
            if (scrollBar != null)
            {
                scrollBar.syncScroll();
            }
            return;
        }// end function

        protected function onSelect(param1:MouseEventEx) : void
        {
            var _loc_5:* = null;
            var _loc_2:* = param1.target as MMaskedListItemRenderer;
            if (_loc_2 == null)
            {
                return;
            }
            var _loc_3:* = new ListEvent(ListEvent.ITEM_CLICK, false, true, _loc_2.index, -1, -1, null, _loc_2.data, 0, param1.buttonIdx, false);
            _loc_3.indexSub = _loc_2.indexSub;
            dispatchEvent(_loc_3);
            if (MouseEventEx.LEFT_BUTTON != param1.buttonIdx)
            {
                return;
            }
            _loc_2.setState(!_loc_2.selected);
            var _loc_4:* = 0;
            if (this.multiSelectable == false)
            {
                _loc_4 = 0;
                while (_loc_4 < this.arrSelectedIndex.length)
                {
                    
                    _loc_5 = mcItemRenderer.getChildAt(this.arrSelectedIndex[_loc_4]) as MMaskedListItemRenderer;
                    if (_loc_5.index == _loc_2.index)
                    {
                    }
                    else if (_loc_5.selected == true)
                    {
                        _loc_5.setState(false);
                    }
                    _loc_4++;
                }
                this.arrSelectedIndex = [];
            }
            else if (_loc_2.selected == false)
            {
                _loc_4 = 0;
                while (_loc_4 < this.arrSelectedIndex.length)
                {
                    
                    if (this.arrSelectedIndex[_loc_4] == _loc_2.index)
                    {
                        this.arrSelectedIndex.splice(_loc_4, 1);
                        break;
                    }
                    _loc_4++;
                }
            }
            if (_loc_2.selected == true)
            {
                this.arrSelectedIndex.push(_loc_2.index);
            }
            dispatchEvent(new ListEvent(ListEvent.INDEX_CHANGE, false, true, _loc_2.index, -1, -1, null, _loc_2.data, 0, param1.buttonIdx, false));
            return;
        }// end function

        protected function onDoubleClick(param1:MouseEventEx) : void
        {
            var _loc_2:* = param1.target as MMaskedListItemRenderer;
            if (_loc_2 == null)
            {
                return;
            }
            if (MouseEventEx.LEFT_BUTTON != param1.buttonIdx)
            {
                return;
            }
            dispatchEvent(new ListEvent(ListEvent.ITEM_DOUBLE_CLICK, false, true, _loc_2.index, -1, -1, null, _loc_2.data, 0, param1.buttonIdx, false));
            return;
        }// end function

    }
}
