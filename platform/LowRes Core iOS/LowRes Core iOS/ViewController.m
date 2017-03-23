//
// Copyright 2016 Timo Kloss
//
// This file is part of LowRes Core.
//
// LowRes Core is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// LowRes Core is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with LowRes Core.  If not, see <http://www.gnu.org/licenses/>.
//

#import "ViewController.h"
#import "lowres_core.h"
#import "RendererViewController.h"

@interface ViewController ()
@property RendererViewController *rendererViewController;
@end

@implementation ViewController {
    struct LowResCore *_core;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _core = calloc(1, sizeof(struct LowResCore));
    if (!_core)
    {
        printf("Alloc failed\n");
    }
    else
    {
        LRC_init(_core);
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"bas" inDirectory:@"bas"];
        NSString *demoProgram = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:nil];
        
        enum ErrorCode errorCode = LRC_compileProgram(_core, [demoProgram cStringUsingEncoding:NSASCIIStringEncoding]);
        if (errorCode != ErrorNone)
        {
            printf("Compiler error at position %d: %s\n", _core->interpreter.pc->sourcePosition, ErrorStrings[errorCode]);
        }
        else
        {
            printf("Compiler success\n");
            [self.rendererViewController setCore:_core];
            enum ErrorCode errorCode = LRC_runProgram(_core);
            printf("Finished at position %d: %s\n", _core->interpreter.pc->sourcePosition, ErrorStrings[errorCode]);
        }
        LRC_freeProgram(_core);
    }
}

- (void)dealloc
{
    if (_core)
    {
        [self.rendererViewController setCore:NULL];
        free(_core);
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"renderer"])
    {
        self.rendererViewController = segue.destinationViewController;
    }
}

@end
