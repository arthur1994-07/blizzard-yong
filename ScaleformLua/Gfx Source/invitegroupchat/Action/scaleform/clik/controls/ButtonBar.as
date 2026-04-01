package scaleform.clik.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import flash.text.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.clik.ui.*;

    public class ButtonBar extends UIComponent
    {
        protected var _autoSize:String = "none";
        protected var _buttonWidth:Number = 0;
        protected var _dataProvider:IDataProvider;
        protected var _direction:String = "horizontal";
        protected var _group:ButtonGroup;
        protected var _itemRenderer:String = "Button";
        protected var _itemRendererClass:Class;
        protected var _labelField:String = "label";
        protected var _labelFunction:Function;
        protected var _renderers:Array;
        protected var _spacing:Number = 0;
        protected var _selectedIndex:Number = -1;
        protected var _visibleCount:int = 0;
        protected var _preventAutoSize:Boolean = false;
        public var container:MovieClip;
        public static const DIRECTION_HORIZONTAL:String = "horizontal";
        public static const DIRECTION_VERTICAL:String = "vertical";

        public function ButtonBar()
        {
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage, false, 0, true);
            return;
        }// end function

        protected function onAddedToStage(event:Event) : void
        {
            if (this.dataProvider.length != 0)
            {
                this.handleDataChange(null);
            }
            return;
        }// end function

        override protected function initialize() : void
        {
            super.initialize();
            this.dataProvider = new DataProvider();
            this._renderers = [];
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return super.enabled;
        }// end function

        override public function set enabled(param1:Boolean) : void
        {
            if (this.enabled == param1)
            {
                return;
            }
            super.enabled = param1;
            var _loc_2:* = 0;
            while (_loc_2 < this._renderers.length)
            {
                
                if (this._itemRendererClass)
                {
                    (this._renderers[_loc_2] as this._itemRendererClass).enabled = param1;
                }
                else
                {
                    (this._renderers[_loc_2] as UIComponent).enabled = param1;
                }
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        public function get preventAutoSize() : Boolean
        {
            return this._preventAutoSize;
        }// end function

        public function set preventAutoSize(param1:Boolean) : void
        {
            this._preventAutoSize = param1;
            var _loc_2:* = 0;
            while (_loc_2 < this._renderers.length)
            {
                
                if (this._itemRendererClass)
                {
                    (this._renderers[_loc_2] as this._itemRendererClass).preventAutoSize = param1;
                }
                else
                {
                    (this._renderers[_loc_2] as Button).preventAutoSize = param1;
                }
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        override public function get focusable() : Boolean
        {
            return _focusable;
        }// end function

        override public function set focusable(param1:Boolean) : void
        {
            super.focusable = param1;
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
            if (this._dataProvider != null)
            {
                this._dataProvider.removeEventListener(Event.CHANGE, this.handleDataChange, false);
            }
            this._dataProvider = param1;
            if (this._dataProvider == null)
            {
                return;
            }
            this._dataProvider.addEventListener(Event.CHANGE, this.handleDataChange, false, 0, true);
            invalidateData();
            this._visibleCount = this._dataProvider.length - 1;
            return;
        }// end function

        public function set itemRendererName(param1:String) : void
        {
            var domain:ApplicationDomain;
            var classRef:Class;
            var value:* = param1;
            if (_inspector && value == "Button" || value == "")
            {
                return;
            }
            try
            {
                domain = ApplicationDomain.currentDomain;
                if (loaderInfo != null && loaderInfo.applicationDomain != null)
                {
                    domain = loaderInfo.applicationDomain;
                }
                classRef = domain.getDefinition(value) as Class;
            }
            catch (error)
            {
                throw new Error("The class " + value + " cannot be found in your library. Please ensure it exists.");
            }
            if (classRef != null)
            {
                this._itemRendererClass = classRef;
                invalidate();
            }
            return;
        }// end function

        public function get spacing() : Number
        {
            return this._spacing;
        }// end function

        public function set spacing(param1:Number) : void
        {
            this._spacing = param1;
            this.invalidateSettings();
            return;
        }// end function

        public function get direction() : String
        {
            return this._direction;
        }// end function

        public function set direction(param1:String) : void
        {
            this._direction = param1;
            this.invalidateSettings();
            return;
        }// end function

        public function get autoSize() : String
        {
            return this._autoSize;
        }// end function

        public function set autoSize(param1:String) : void
        {
            if (param1 == this._autoSize)
            {
                return;
            }
            this._autoSize = param1;
            var _loc_2:* = 0;
            while (_loc_2 < this._renderers.length)
            {
                
                (this._renderers[_loc_2] as this._itemRendererClass).autoSize = this._autoSize;
                _loc_2 = _loc_2 + 1;
            }
            this.invalidateSettings();
            return;
        }// end function

        public function get buttonWidth() : Number
        {
            return this._buttonWidth;
        }// end function

        public function set buttonWidth(param1:Number) : void
        {
            this._buttonWidth = param1;
            invalidate();
            return;
        }// end function

        public function get selectedIndex() : int
        {
            return this._selectedIndex;
        }// end function

        public function set selectedIndex(param1:int) : void
        {
            if (param1 == this._selectedIndex)
            {
                return;
            }
            var _loc_2:* = this._selectedIndex;
            var _loc_3:* = this._renderers[_loc_2] as Button;
            if (_loc_3)
            {
                _loc_3.selected = false;
            }
            this._selectedIndex = param1;
            _loc_3 = this._renderers[this._selectedIndex] as Button;
            if (_loc_3)
            {
                _loc_3.selected = true;
            }
            dispatchEventAndSound(new IndexEvent(IndexEvent.INDEX_CHANGE, true, true, this._selectedIndex, _loc_2, this._dataProvider[this._selectedIndex]));
            return;
        }// end function

        public function get selectedItem() : Object
        {
            return this._dataProvider.requestItemAt(this._selectedIndex);
        }// end function

        public function get data() : Object
        {
            return this.selectedItem.data;
        }// end function

        public function get labelField() : String
        {
            return this._labelField;
        }// end function

        public function set labelField(param1:String) : void
        {
            this._labelField = param1;
            invalidateData();
            return;
        }// end function

        public function get labelFunction() : Function
        {
            return this._labelFunction;
        }// end function

        public function set labelFunction(param1:Function) : void
        {
            this._labelFunction = param1;
            invalidateData();
            return;
        }// end function

        public function invalidateSettings() : void
        {
            invalidate(InvalidationType.SETTINGS);
            return;
        }// end function

        public function itemToLabel(param1:Object) : String
        {
            if (param1 == null)
            {
                return "";
            }
            if (this._labelFunction != null)
            {
                return this._labelFunction(param1);
            }
            if (param1 is String)
            {
                return param1 as String;
            }
            if (this._labelField != null && param1[this._labelField] != null)
            {
                return param1[this._labelField];
            }
            return param1.toString();
        }// end function

        public function getButtonAt(param1:int) : Button
        {
            if (param1 >= 0 && param1 < this._renderers.length)
            {
                return this._renderers[param1];
            }
            return null;
        }// end function

        public function ChangeButtonLabel(param1:int, param2:String) : void
        {
            if (this.dataProvider.length <= param1)
            {
                return;
            }
            var _loc_3:* = typeof(this.dataProvider[param1]);
            if (_loc_3 == "string")
            {
                this.dataProvider[param1] = param2;
            }
            else if (_loc_3 == "object")
            {
                this.dataProvider[param1].label = param2;
            }
            invalidateData();
            return;
        }// end function

        public function VisibleButtonCount(param1:uint) : void
        {
            var _loc_3:* = null;
            param1 = param1 - 1;
            this._visibleCount = param1;
            var _loc_2:* = 0;
            while (_loc_2 < this._renderers.length)
            {
                
                _loc_3 = this._renderers[_loc_2] as Button;
                if (_loc_2 <= this._visibleCount)
                {
                    _loc_3.visible = true;
                }
                else
                {
                    _loc_3.visible = false;
                }
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        override public function handleInput(event:InputEvent) : void
        {
            var _loc_6:* = NaN;
            if (event.handled)
            {
                return;
            }
            var _loc_2:* = this._renderers[this._selectedIndex] as Button;
            if (_loc_2 != null)
            {
                _loc_2.handleInput(event);
                if (event.handled)
                {
                    return;
                }
            }
            var _loc_3:* = event.details;
            var _loc_4:* = _loc_3.value == InputValue.KEY_DOWN || _loc_3.value == InputValue.KEY_HOLD;
            if (!(_loc_3.value == InputValue.KEY_DOWN || _loc_3.value == InputValue.KEY_HOLD))
            {
                return;
            }
            var _loc_5:* = false;
            switch(_loc_3.navEquivalent)
            {
                case NavigationCode.LEFT:
                {
                    if (this._direction == DIRECTION_HORIZONTAL)
                    {
                        _loc_6 = this._selectedIndex - 1;
                        _loc_5 = true;
                    }
                    break;
                }
                case NavigationCode.RIGHT:
                {
                    if (this._direction == DIRECTION_HORIZONTAL)
                    {
                        _loc_6 = this._selectedIndex + 1;
                        _loc_5 = true;
                    }
                    break;
                }
                case NavigationCode.UP:
                {
                    if (this._direction == DIRECTION_VERTICAL)
                    {
                        _loc_6 = this._selectedIndex - 1;
                        _loc_5 = true;
                    }
                    break;
                }
                case NavigationCode.DOWN:
                {
                    if (this._direction == DIRECTION_VERTICAL)
                    {
                        _loc_6 = this._selectedIndex + 1;
                        _loc_5 = true;
                    }
                    break;
                }
                default:
                {
                    break;
                    break;
                }
            }
            if (_loc_5)
            {
                _loc_6 = Math.max(0, Math.min((this._dataProvider.length - 1), _loc_6));
                if (_loc_6 != this._selectedIndex)
                {
                    this.selectedIndex = _loc_6;
                    event.handled = true;
                }
            }
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK ButtonBar " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            tabEnabled = _focusable && this.enabled;
            if (this._group == null)
            {
                this._group = new ButtonGroup(name + "Group", this);
            }
            this._group.addEventListener(ButtonEvent.CLICK, this.handleButtonGroupChange, false, 0, true);
            if (this.container == null)
            {
                this.container = new MovieClip();
                addChild(this.container);
            }
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.RENDERERS) || isInvalid(InvalidationType.DATA) || isInvalid(InvalidationType.SETTINGS) || isInvalid(InvalidationType.SIZE))
            {
                removeChild(this.container);
                setActualSize(_width, _height);
                this.container.scaleX = 1 / scaleX;
                this.container.scaleY = 1 / scaleY;
                addChild(this.container);
                this.updateRenderers();
            }
            return;
        }// end function

        protected function refreshData() : void
        {
            this.selectedIndex = Math.min((this._dataProvider.length - 1), this._selectedIndex);
            if (this._dataProvider)
            {
                this._dataProvider.requestItemRange(0, (this._dataProvider.length - 1), this.populateData);
            }
            return;
        }// end function

        protected function updateRenderers() : void
        {
            var _loc_5:* = 0;
            var _loc_6:* = null;
            var _loc_7:* = false;
            var _loc_8:* = 0;
            var _loc_9:* = null;
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            var _loc_3:* = -1;
            if (this._renderers[0] is this._itemRendererClass)
            {
                while (this._renderers.length > this._dataProvider.length)
                {
                    
                    _loc_5 = this._renderers.length - 1;
                    if (this.container.contains(this._renderers[_loc_5]))
                    {
                        this.container.removeChild(this._renderers[_loc_5]);
                    }
                    this._renderers.splice(_loc_5--, 1);
                }
            }
            else
            {
                while (this.container.numChildren > 0)
                {
                    
                    this.container.removeChildAt(0);
                }
                this._renderers.length = 0;
            }
            var _loc_4:* = 0;
            while (_loc_4 < this._dataProvider.length && _loc_3 == -1)
            {
                
                _loc_7 = false;
                if (_loc_4 < this._renderers.length)
                {
                    _loc_6 = this._renderers[_loc_4];
                }
                else
                {
                    _loc_6 = new this._itemRendererClass();
                    this.setupRenderer(_loc_6, _loc_4);
                    _loc_7 = true;
                }
                this.populateRendererData(_loc_6, _loc_4);
                if (this._autoSize == TextFieldAutoSize.NONE && this._buttonWidth > 0)
                {
                    _loc_6.width = this._buttonWidth;
                }
                else if (this._autoSize != TextFieldAutoSize.NONE)
                {
                    _loc_6.autoSize = this._autoSize;
                }
                _loc_6.validateNow();
                if (this._direction == DIRECTION_HORIZONTAL)
                {
                    if (_width > _loc_6.width + this._spacing + _loc_1)
                    {
                        _loc_6.y = 0;
                        _loc_6.x = _loc_1;
                        _loc_1 = _loc_1 + (_loc_6.width + this._spacing);
                    }
                    else
                    {
                        _loc_3 = _loc_4;
                        _loc_6 = null;
                    }
                }
                else if (_height > _loc_6.height + this._spacing + _loc_2)
                {
                    _loc_6.x = 0;
                    _loc_6.y = _loc_2;
                    _loc_2 = _loc_2 + (_loc_6.height + this._spacing);
                }
                else
                {
                    _loc_3 = _loc_4;
                    _loc_6 = null;
                }
                if (_loc_6 != null)
                {
                    _loc_6.group = this._group;
                    if (_loc_7 == true)
                    {
                        if (_loc_4 <= this._visibleCount)
                        {
                            _loc_6.visible = true;
                        }
                        else
                        {
                            _loc_6.visible = false;
                        }
                        _loc_6.preventAutoSize = this._preventAutoSize;
                        this.container.addChild(_loc_6);
                        this._renderers.push(_loc_6);
                    }
                }
                _loc_4 = _loc_4 + 1;
            }
            if (_loc_3 > -1)
            {
                _loc_8 = this._renderers.length - 1;
                while (_loc_8 >= _loc_3)
                {
                    
                    _loc_9 = this._renderers[_loc_8];
                    if (_loc_9)
                    {
                        if (this.container.contains(_loc_9))
                        {
                            this.container.removeChild(_loc_9);
                        }
                        this._renderers.splice(_loc_8, 1);
                    }
                    _loc_8 = _loc_8 - 1;
                }
            }
            this.selectedIndex = Math.min((this._dataProvider.length - 1), this._selectedIndex);
            return;
        }// end function

        protected function populateData(param1:Array) : void
        {
            var _loc_3:* = null;
            var _loc_2:* = 0;
            while (_loc_2 < this._renderers.length)
            {
                
                _loc_3 = this._renderers[_loc_2] as Button;
                this.populateRendererData(_loc_3, _loc_2);
                _loc_3.validateNow();
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        protected function populateRendererData(param1:Button, param2:uint) : void
        {
            param1.label = this.itemToLabel(this._dataProvider.requestItemAt(param2));
            param1.data = this._dataProvider.requestItemAt(param2);
            param1.selected = param2 == this.selectedIndex;
            return;
        }// end function

        protected function setupRenderer(param1:Button, param2:uint) : void
        {
            param1.owner = this;
            param1.focusable = false;
            param1.focusTarget = this;
            param1.toggle = true;
            param1.allowDeselect = false;
            return;
        }// end function

        protected function handleButtonGroupChange(event:Event) : void
        {
            if (this._group.selectedIndex != this.selectedIndex)
            {
                this.selectedIndex = this._group.selectedIndex;
                dispatchEventAndSound(new ButtonBarEvent(ButtonBarEvent.BUTTON_SELECT, false, true, this._selectedIndex, event.target as Button));
            }
            return;
        }// end function

        protected function handleDataChange(event:Event) : void
        {
            invalidate(InvalidationType.DATA);
            return;
        }// end function

        override protected function changeFocus() : void
        {
            var _loc_1:* = this._renderers[this._selectedIndex] as Button;
            if (_loc_1 == null)
            {
                return;
            }
            _loc_1.displayFocus = _focused > 0;
            return;
        }// end function

    }
}
