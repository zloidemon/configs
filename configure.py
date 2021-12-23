#!/usr/bin/env python

import apps
import utils
import io


if __name__ == '__main__':
    config = utils.Merger().config()

    buffer = io.StringIO(newline='\n')

    apps.AppXFT.render(config)
    apps.AppXTERM.render(config)
    apps.AppURXVT.render(config, buffer)

    print(buffer.getvalue())
