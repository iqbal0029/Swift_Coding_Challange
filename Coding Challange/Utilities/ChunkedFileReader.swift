//
//  ChunkedFileReader.swift
//  Coding Challange
//
//  Created by Faisal Ikwal on 30/11/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation

class ChunkedFileReader {
    var fileHandle: FileHandle?

    // we keep adding to the buffer until eventually we find a line break or hit the end of the file
    var buffer: Data

    // this should be between 1024 and 8192 for production; it determines how much of the file is read in each step
    let chunkSize: Int = 4

    // this determines what we consider to be an end of line
    let delimiter = "\n".data(using: .utf8)!

    init(path: String) {
        // open the file handle and prepare the buffer
        fileHandle = FileHandle(forReadingAtPath: path)
        buffer = Data(capacity: chunkSize)
    }

    func readLine() -> String? {
        // find the delimiter in our buffer
        var rangeOfDelimiter = buffer.range(of: delimiter)

        // loop until we finally find a delimiter
        while rangeOfDelimiter == nil {

            // try to read a chunk from the file handle, or bail out if it didn't work
            guard let chunk = fileHandle?.readData(ofLength:
                chunkSize) else { return nil }

            if chunk.count == 0 {

                // the chunk was read successfully, but was empty – we reached the end of the file
                if buffer.count > 0 {

                    // the buffer has something left in it; send it back, and make sure to clear the buffer's remnants when it's finished
                    defer { buffer.count = 0 }
                    return String(data: buffer, encoding: .utf8)
                }
                
                // we reached the end of the file and the buffer was empty; send back nil
                return nil
            } else {
                // we read some data; append it to our buffer
                buffer.append(chunk)

                // now re-scan for the delimiter
                rangeOfDelimiter = buffer.range(of: delimiter)
            }
        }
        // we can only make it here if we found a delimiter, but it might be anywhere inside our buffer; we want to pull out everything in our buffer from the start up to where the delimiter lies
        let rangeOfLine = 0 ..< rangeOfDelimiter!.upperBound

        // convert that range of our buffer into a string
        let line = String(data: buffer.subdata(in: rangeOfLine), encoding: .utf8)

        // then remove it from the buffer
        buffer.removeSubrange(rangeOfLine)

        // send the line back, removing the trailing line break at the end.
        return line?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
