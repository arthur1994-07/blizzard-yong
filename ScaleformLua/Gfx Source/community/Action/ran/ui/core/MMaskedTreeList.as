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

    public class MMaskedTreeList extends MMaskedView
    {
        protected var headRendererClass:Class;
        protected var itemRendererClass:Class;
        protected var _headDataProvider:IDataProvider;
        protected var _mapTreeData:Dictionary;
        protected var _headRendererName:String = "";
        protected var _itemRendererName:String = "";
        public var itemRendererOffsetY:int;
        protected var selectedIndex:int = -1;
        protected var selectedIndexSub:int = -1;
        protected var mapCreatedItemRenderer:Dictionary;

        public function MMaskedTreeList()
        {
            this.mapCreatedItemRenderer = new Dictionary();
            return;
        }// end function

        public function invalidateRenderer() : void
        {
            invalidate(InvalidationType.RENDERERS);
            return;
        }// end function

        public function get headDataProvider() : IDataProvider
        {
            return this._headDataProvider;
        }// end function

        public function set headDataProvider(param1:IDataProvider) : void
        {
            if (this._headDataProvider == param1)
            {
                return;
            }
            this._headDataProvider = param1;
            if (this._headDataProvider == null)
            {
                return;
            }
            invalidateData();
            return;
        }// end function

        public function get mapTreeData() : Dictionary
        {
            return this._mapTreeData;
        }// end function

        public function set mapTreeData(param1:Dictionary) : void
        {
            if (this._mapTreeData == param1)
            {
                return;
            }
            this._mapTreeData = param1;
            if (this._mapTreeData == null)
            {
                return;
            }
            invalidateData();
            validateNow();
            return;
        }// end function

        public function get headRendererName() : String
        {
            return this._headRendererName;
        }// end function

        public function set headRendererName(param1:String) : void
        {
            this._headRendererName = param1;
            if (this._headRendererName == "")
            {
                return;
            }
            var _loc_2:* = ApplicationDomain.currentDomain;
            if (loaderInfo != null && loaderInfo.applicationDomain != null)
            {
                _loc_2 = loaderInfo.applicationDomain;
            }
            this.headRendererClass = _loc_2.getDefinition(this._headRendererName) as Class;
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
            if (isInvalid(InvalidationType.RENDERERS) == true)
            {
                this.updateItemData();
            }
            return;
        }// end function

        protected function updateData() : void
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = 0;
            var _loc_8:* = null;
            var _loc_9:* = null;
            while (mcItemRenderer.numChildren != 0)
            {
                
                mcItemRenderer.removeChildAt(0);
            }
            if (this._headDataProvider == null || this._mapTreeData == null)
            {
                return;
            }
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            while (_loc_2 < this._headDataProvider.length)
            {
                
                _loc_3 = "head" + _loc_2;
                _loc_4 = this.mapCreatedItemRenderer[_loc_3];
                if (_loc_4 == null)
                {
                    _loc_4 = new this.headRendererClass() as MMaskedListItemRenderer;
                    this.mapCreatedItemRenderer[_loc_3] = _loc_4;
                    if (_loc_4 == null)
                    {
                        trace("Head class could not be created.");
                        break;
                    }
                    _loc_4.name = _loc_3;
                    _loc_4.width = Math.floor(_loc_4.width);
                    _loc_4.height = Math.floor(_loc_4.height);
                }
                _loc_5 = this._headDataProvider[_loc_2];
                if (_loc_5.expand == "false" || _loc_5.expand == 0)
                {
                    _loc_5.expand = false;
                }
                else if (_loc_5.expand == "true" || _loc_5.expand != 0)
                {
                    _loc_5.expand = true;
                }
                _loc_4.x = 0;
                _loc_4.y = _loc_1++ * (_loc_4.height + this.itemRendererOffsetY);
                _loc_4.index = _loc_2;
                _loc_4.data = _loc_5;
                _loc_4.addEventListener(MouseEvent.CLICK, this.onHeadFold, false, 0, true);
                _loc_4.setState(_loc_5.expand);
                mcItemRenderer.addChild(_loc_4);
                _loc_6 = this._mapTreeData[_loc_5.key];
                if (_loc_6 == null)
                {
                }
                else
                {
                    _loc_7 = 0;
                    while (_loc_7 < _loc_6.length)
                    {
                        
                        _loc_8 = "item" + _loc_2 + "_" + _loc_7;
                        _loc_9 = this.mapCreatedItemRenderer[_loc_8];
                        if (_loc_9 == null)
                        {
                            _loc_9 = new this.itemRendererClass() as MMaskedListItemRenderer;
                            this.mapCreatedItemRenderer[_loc_8] = _loc_9;
                            if (_loc_9 == null)
                            {
                                trace("Renderer class could not be created.");
                                break;
                            }
                            _loc_9.name = _loc_8;
                            _loc_9.width = Math.floor(_loc_9.width / this.scaleX);
                            _loc_9.height = Math.floor(_loc_9.height / this.scaleY);
                        }
                        if (_loc_5.expand == false)
                        {
                        }
                        else
                        {
                            _loc_9.x = 0;
                            _loc_9.y = _loc_1++ * (_loc_9.height + this.itemRendererOffsetY);
                            _loc_9.index = _loc_2;
                            _loc_9.indexSub = _loc_7;
                            _loc_9.key = _loc_5.key;
                            _loc_9.data = _loc_6[_loc_7];
                            _loc_9.addEventListener(MouseEvent.CLICK, this.onSelect, false, 0, true);
                            mcItemRenderer.addChild(_loc_9);
                        }
                        _loc_7++;
                    }
                }
                _loc_2++;
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

        protected function updateItemData() : void
        {
            var _loc_2:* = null;
            var _loc_1:* = 0;
            while (_loc_1 < mcItemRenderer.numChildren)
            {
                
                _loc_2 = mcItemRenderer.getChildAt(_loc_1) as MMaskedListItemRenderer;
                if (_loc_2 == null)
                {
                }
                else
                {
                    _loc_2.updateText();
                }
                _loc_1++;
            }
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

        protected function onHeadFold(param1:MouseEventEx) : void
        {
            var _loc_4:* = null;
            var _loc_2:* = param1.target as MMaskedListItemRenderer;
            if (_loc_2 == null)
            {
                return;
            }
            var _loc_3:* = this._headDataProvider[_loc_2.index];
            if (_loc_3 == null)
            {
                return;
            }
            _loc_4 = new ListEvent(ListEvent.ITEM_CLICK, false, true, _loc_2.index, -1, -1, null, _loc_2.data, 0, param1.buttonIdx, false);
            _loc_4.indexSub = _loc_2.indexSub;
            dispatchEvent(_loc_4);
            if (MouseEventEx.LEFT_BUTTON != param1.buttonIdx)
            {
                return;
            }
            _loc_3.expand = !_loc_3.expand;
            _loc_2.setState(_loc_3.expand);
            invalidateData();
            validateNow();
            if (_loc_3.expand == true)
            {
                dispatchEvent(new TreeEvent(TreeEvent.ITEM_EXPAND, _loc_2.index));
            }
            else
            {
                dispatchEvent(new TreeEvent(TreeEvent.ITEM_COLLAPSE, _loc_2.index));
            }
            return;
        }// end function

        protected function onSelect(param1:MouseEventEx) : void
        {
            var _loc_4:* = null;
            var _loc_2:* = param1.target as MMaskedListItemRenderer;
            if (_loc_2 == null)
            {
                return;
            }
            var _loc_3:* = new ListEvent(ListEvent.ITEM_CLICK, false, true, _loc_2.index, -1, -1, null, _loc_2.data, 0, param1.buttonIdx, false);
            _loc_3.indexSub = _loc_2.indexSub;
            _loc_3.key = _loc_2.key;
            dispatchEvent(_loc_3);
            if (MouseEventEx.LEFT_BUTTON != param1.buttonIdx)
            {
                return;
            }
            _loc_2.setState(!_loc_2.selected);
            if (this.selectedIndex != -1 && this.selectedIndexSub != -1)
            {
                _loc_4 = this.mapCreatedItemRenderer["item" + this.selectedIndex + "_" + this.selectedIndexSub];
                if (_loc_4 != null)
                {
                    _loc_4.setState(false);
                }
            }
            if (_loc_2.selected == true)
            {
                this.selectedIndex = _loc_2.index;
                this.selectedIndexSub = _loc_2.indexSub;
            }
            else
            {
                this.selectedIndex = -1;
                this.selectedIndexSub = -1;
            }
            _loc_3 = new ListEvent(ListEvent.INDEX_CHANGE, false, true, _loc_2.index, -1, -1, null, _loc_2.data, 0, param1.buttonIdx, false);
            _loc_3.indexSub = _loc_2.indexSub;
            _loc_3.key = _loc_2.key;
            dispatchEvent(_loc_3);
            return;
        }// end function

    }
}
