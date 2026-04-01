package scaleform.clik.controls
{
    import flash.events.*;
    import flash.text.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.data.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.clik.ui.*;
    import scaleform.clik.utils.*;

    public class OptionStepper extends UIComponent
    {
        public var selectedItem:Object;
        protected var _dataProvider:IDataProvider;
        protected var _selectedIndex:Number = 0;
        protected var _newSelectedIndex:int = 0;
        protected var _labelField:String = "label";
        protected var _labelFunction:Function;
        protected var _state:String = "default";
        protected var _newFrame:String;
        protected var _constraintsDisabled:Boolean = false;
        public var textField:TextField;
        public var nextBtn:Button;
        public var prevBtn:Button;

        public function OptionStepper()
        {
            return;
        }// end function

        override protected function preInitialize() : void
        {
            if (!this._constraintsDisabled)
            {
                constraints = new Constraints(this, ConstrainMode.COUNTER_SCALE);
            }
            return;
        }// end function

        override protected function initialize() : void
        {
            this.dataProvider = new DataProvider();
            super.initialize();
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return super.enabled;
        }// end function

        override public function set enabled(param1:Boolean) : void
        {
            if (param1 == super.enabled)
            {
                return;
            }
            super.enabled = param1;
            mouseEnabled = this.enabled;
            tabEnabled = _focusable && this.enabled;
            gotoAndPlay(param1 ? (_focused > 0 ? ("focused") : ("default")) : ("disabled"));
            if (!initialized)
            {
                return;
            }
            this.updateAfterStateChange();
            var _loc_2:* = param1;
            this.nextBtn.enabled = param1;
            this.prevBtn.enabled = _loc_2;
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
            if (this._dataProvider != param1)
            {
                if (this._dataProvider != null)
                {
                    this._dataProvider.removeEventListener(Event.CHANGE, this.handleDataChange);
                }
                this._dataProvider = param1;
                this.selectedItem = null;
                if (this._dataProvider == null)
                {
                    return;
                }
                this._dataProvider.addEventListener(Event.CHANGE, this.handleDataChange);
            }
            invalidateData();
            this.updateSelectedItem();
            return;
        }// end function

        public function get selectedIndex() : int
        {
            return this._selectedIndex;
        }// end function

        public function set selectedIndex(param1:int) : void
        {
            var _loc_2:* = Math.max(0, Math.min((this._dataProvider.length - 1), param1));
            if (_loc_2 == this._selectedIndex || _loc_2 == this._newSelectedIndex)
            {
                return;
            }
            this._newSelectedIndex = _loc_2;
            this.invalidateSelectedIndex();
            return;
        }// end function

        public function get labelField() : String
        {
            return this._labelField;
        }// end function

        public function set labelField(param1:String) : void
        {
            this._labelField = param1;
            this.updateLabel();
            return;
        }// end function

        public function get labelFunction() : Function
        {
            return this._labelFunction;
        }// end function

        public function set labelFunction(param1:Function) : void
        {
            this._labelFunction = param1;
            this.updateLabel();
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
            if (this._labelField != null && this._labelField in param1 && param1[this._labelField] != null)
            {
                return param1[this._labelField];
            }
            return param1.toString();
        }// end function

        public function invalidateSelectedIndex() : void
        {
            invalidate(InvalidationType.SELECTED_INDEX);
            return;
        }// end function

        override public function handleInput(event:InputEvent) : void
        {
            if (event.isDefaultPrevented())
            {
                return;
            }
            var _loc_2:* = event.details;
            var _loc_3:* = _loc_2.controllerIndex;
            var _loc_4:* = _loc_2.value == InputValue.KEY_DOWN || _loc_2.value == InputValue.KEY_HOLD;
            switch(_loc_2.navEquivalent)
            {
                case NavigationCode.RIGHT:
                {
                    if (this._selectedIndex < (this._dataProvider.length - 1))
                    {
                        if (_loc_4)
                        {
                            this.onNext(null);
                        }
                        event.handled = true;
                    }
                    break;
                }
                case NavigationCode.LEFT:
                {
                    if (this._selectedIndex > 0)
                    {
                        if (_loc_4)
                        {
                            this.onPrev(null);
                        }
                        event.handled = true;
                    }
                    break;
                }
                case NavigationCode.HOME:
                {
                    if (!_loc_4)
                    {
                        this.selectedIndex = 0;
                    }
                    event.handled = true;
                    break;
                }
                case NavigationCode.END:
                {
                    if (!_loc_4)
                    {
                        this.selectedIndex = this._dataProvider.length - 1;
                    }
                    event.handled = true;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        override public function toString() : String
        {
            return "[CLIK OptionStepper " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            if (!this._constraintsDisabled)
            {
                constraints.addElement("textField", this.textField, Constraints.ALL);
            }
            addEventListener(InputEvent.INPUT, this.handleInput, false, 0, true);
            this.nextBtn.addEventListener(ButtonEvent.CLICK, this.onNext, false, 0, true);
            this.prevBtn.addEventListener(ButtonEvent.CLICK, this.onPrev, false, 0, true);
            tabEnabled = _focusable;
            tabChildren = false;
            var _loc_1:* = false;
            this.textField.mouseEnabled = false;
            this.textField.tabEnabled = _loc_1;
            var _loc_1:* = this.enabled;
            this.nextBtn.enabled = this.enabled;
            this.prevBtn.enabled = _loc_1;
            var _loc_1:* = false;
            this.nextBtn.autoRepeat = false;
            this.prevBtn.autoRepeat = _loc_1;
            var _loc_1:* = false;
            this.nextBtn.focusable = false;
            this.prevBtn.focusable = _loc_1;
            var _loc_1:* = this;
            this.nextBtn.focusTarget = this;
            this.prevBtn.focusTarget = _loc_1;
            var _loc_1:* = false;
            this.nextBtn.tabEnabled = false;
            this.prevBtn.tabEnabled = _loc_1;
            var _loc_1:* = true;
            this.nextBtn.mouseEnabled = true;
            this.prevBtn.mouseEnabled = _loc_1;
            invalidateSize();
            return;
        }// end function

        override protected function draw() : void
        {
            if (isInvalid(InvalidationType.SELECTED_INDEX))
            {
                this.updateSelectedIndex();
            }
            if (isInvalid(InvalidationType.STATE))
            {
                if (this._newFrame)
                {
                    gotoAndPlay(this._newFrame);
                    this._newFrame = null;
                }
                this.updateAfterStateChange();
                dispatchEventAndSound(new ComponentEvent(ComponentEvent.STATE_CHANGE));
                invalidate(InvalidationType.DATA);
            }
            if (isInvalid(InvalidationType.DATA))
            {
                this.refreshData();
            }
            if (isInvalid(InvalidationType.SIZE))
            {
                setActualSize(_width, _height);
                if (!this._constraintsDisabled)
                {
                    constraints.update(_width, _height);
                    this.updateLabel();
                }
            }
            return;
        }// end function

        override protected function changeFocus() : void
        {
            if (_focused || _displayFocus)
            {
                this.setState("focused", "default");
            }
            else
            {
                this.setState("default");
            }
            var _loc_1:* = _focused > 0;
            this.nextBtn.displayFocus = _focused > 0;
            this.prevBtn.displayFocus = _loc_1;
            return;
        }// end function

        protected function updateSelectedIndex() : void
        {
            if (this._selectedIndex == this._newSelectedIndex)
            {
                return;
            }
            var _loc_1:* = this._selectedIndex;
            this._selectedIndex = this._newSelectedIndex;
            dispatchEventAndSound(new IndexEvent(IndexEvent.INDEX_CHANGE, true, false, this._selectedIndex, _loc_1, this.dataProvider[this._selectedIndex]));
            this.updateSelectedItem();
            return;
        }// end function

        protected function refreshData() : void
        {
            this._dataProvider.requestItemAt(this._selectedIndex, this.populateText);
            return;
        }// end function

        protected function handleDataChange(event:Event) : void
        {
            invalidate(InvalidationType.DATA);
            return;
        }// end function

        protected function updateAfterStateChange() : void
        {
            invalidateSize();
            this.updateLabel();
            var _loc_1:* = false;
            this.textField.mouseEnabled = false;
            this.textField.tabEnabled = _loc_1;
            if (constraints != null && !this._constraintsDisabled)
            {
                constraints.updateElement("textField", this.textField);
            }
            return;
        }// end function

        protected function updateLabel() : void
        {
            var _loc_1:* = NaN;
            var _loc_2:* = 0;
            if (this.selectedItem == null)
            {
                return;
            }
            if (this.textField != null)
            {
                this.textField.text = this.itemToLabel(this.selectedItem);
                _loc_1 = this.textField.width / constraints.getElement("textField").clip.scaleX;
                if (_loc_1 < this.textField.textWidth)
                {
                    TooltipHtmlText = this.textField.text;
                    _loc_2 = 0;
                    while (_loc_2 < this.textField.length)
                    {
                        
                        if (_loc_1 < this.textField.getCharBoundaries(_loc_2).x + this.textField.getCharBoundaries(_loc_2).width)
                        {
                            this.textField.text = this.textField.text.substr(0, _loc_2 - 3) + "...";
                        }
                        _loc_2++;
                    }
                }
                else
                {
                    TooltipHtmlText = "";
                }
            }
            return;
        }// end function

        protected function updateSelectedItem() : void
        {
            invalidateData();
            return;
        }// end function

        protected function populateText(param1:Object) : void
        {
            this.selectedItem = param1;
            this.updateLabel();
            dispatchEventAndSound(new Event(Event.CHANGE));
            return;
        }// end function

        protected function onNext(param1:Object) : void
        {
            (this.selectedIndex + 1);
            this.invalidateSelectedIndex();
            return;
        }// end function

        protected function onPrev(param1:Object) : void
        {
            (this.selectedIndex - 1);
            this.invalidateSelectedIndex();
            return;
        }// end function

        protected function setState(... args) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            if (args.length == 1)
            {
                _loc_4 = args[0].toString();
                if (this._state != _loc_4 && _labelHash[_loc_4])
                {
                    var _loc_6:* = _loc_4;
                    this._newFrame = _loc_4;
                    this._state = _loc_6;
                    invalidateState();
                }
                return;
            }
            args = args.length;
            var _loc_3:* = 0;
            while (_loc_3 < args)
            {
                
                _loc_5 = args[_loc_3].toString();
                if (_labelHash[_loc_5])
                {
                    var _loc_6:* = _loc_5;
                    this._newFrame = _loc_5;
                    this._state = _loc_6;
                    invalidateState();
                    break;
                }
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

    }
}
