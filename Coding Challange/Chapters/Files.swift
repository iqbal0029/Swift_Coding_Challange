//
//  Files.swift
//  Coding Challange
//
//  Created by Faisal Ikwal on 27/11/18.
//  Copyright © 2018 Exilant Technologies. All rights reserved.
//

import Foundation

func bundleUrlFor(filename: String) -> URL? {
    let pathArray = filename.components(separatedBy: ".")
    return Bundle.main.url(forResource: pathArray[0], withExtension: pathArray[safe: 1] ?? "")
}

var documentsFolderURL: URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
}

/*
 Write a function that accepts a filename on disk, then prints its last N lines in reverse order, all
 on a single line separated by commas.
 */
func challenge27(filename: String, lineCount: Int) {
    guard
        lineCount > 0,
        let filePath = bundleUrlFor(filename: filename)?.path,
        let contents = try? String(contentsOfFile: filePath) else { return }
    let textArray = contents.components(separatedBy: "\n").reversed()
    var count = min(lineCount, textArray.count)
    for item in textArray {
        print(item)
        count -= 1
        if count == 0 { break }
    }
}

/*
 Write a logging function that accepts accepts a path to a log file on disk as well as a new log message. Your function should open the log file (or create it if it does not already exist), then append the new message to the log along with the current time and date.
 Tip: It’s important that you add line breaks along with each message, otherwise the log will just become jumbled.
 */
func challenge28(log message: String, to logFile: String) {
    let logFolderURL = documentsFolderURL.appendingPathComponent("Log", isDirectory: true)
    let _ = try? FileManager.default.createDirectory(at: logFolderURL, withIntermediateDirectories: true)
    let logFileURL = logFolderURL.appendingPathComponent(logFile, isDirectory: false)
    var existingLog = (try? String(contentsOfFile: logFileURL.path)) ?? ""
    existingLog.append("\(Date()): \(message)\n")

    do {
        try existingLog.write(to: logFileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Failed to write to log: \(error.localizedDescription)")
    }
    print(existingLog)

}

/*
 Write a function that returns a URL to the user’s documents directory.
 */
func challenge29() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

/*
 Write a function that accepts a path to a directory and returns an array of all png that have
 been created in the last 48 hours.
 */
func challenge30(in directory: String) -> [String] {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else {
        return []
    }
    var pngFiles = [String]()
    for file in files {
        if file.pathExtension == "png" {
            guard let attributes = try? fm.attributesOfItem(atPath: file.path) else { continue }
            guard let creationDate = attributes[.creationDate] as? Date else { continue }
            if creationDate > Date(timeIntervalSinceNow: -60*60*48) {
                pngFiles.append(file.lastPathComponent)
            }
        }
    }
    return pngFiles
}

/*
 Write a function that accepts two paths: the first should point to a directory to copy, and the second should be where the directory should be copied to. Return true if the directory and all its contents were copied successfully; false if the copy failed, or the user specified something other than a directory.
 */
func challenge31(source: String, destination: String) -> Bool {

    let fm = FileManager.default
    var isDirectory: ObjCBool = false
    guard fm.fileExists(atPath: source, isDirectory: &isDirectory) || isDirectory.boolValue == false else {
        return false
    }
    let sourceURL = URL(fileURLWithPath: source)
    let destinationURL = URL(fileURLWithPath: destination)
    do {
        try fm.copyItem(at: sourceURL, to: destinationURL)
    } catch {
        print(error.localizedDescription)
        return false
    }
    return true
}

/*
 Write a function that accepts a filename on disk, loads it into a string, then returns the frequency of a word in that string, taking letter case into account. How you define “word” is worth considering carefully.
 */
func challenge32(filename: String, count: String) -> Int {
    //MARK: Recap
    guard
        let filePath = bundleUrlFor(filename: filename)?.path,
        let contents = try? String(contentsOfFile: filePath) else { return 0 }
    var characterSet = CharacterSet.letters.inverted //all except letter
    characterSet.remove("'")
    //let wordArray = contents.components(separatedBy: .whitespacesAndNewlines)
    let wordArray = contents.components(separatedBy: characterSet)
    return NSCountedSet(array: wordArray).count(for: count)
}

/*
Write a function that accepts the name of a directory to scan, and returns an array of filenames that appear more than once in that directory or any of its subdirectories. Your function should scan all subdirectories, including subdirectories of subdirectories.
 */
func challenge33(in directory: String) -> [String] {
    let fm = FileManager.default
    let dirURL = URL(fileURLWithPath: directory)
    guard let dirEnum = fm.enumerator(at: dirURL, includingPropertiesForKeys: nil) else { return [] }
    
    var seen = Set<String>()
    var duplicate = Set<String>()
    for case let item as URL in dirEnum {
        guard item.hasDirectoryPath == false else { continue }
        let fileName = item.lastPathComponent
        if seen.contains(fileName) {
            duplicate.insert(fileName)
        } else {
            seen.insert(fileName)
        }
    }
    return Array(duplicate)
}
/*
 Write a function that accepts the name of a directory to scan, and returns an array containing the name of any executable files in there.
 */

func challenge34(in directory: String) -> [String] {
    let fm = FileManager.default
    let dirURL = URL(fileURLWithPath: directory)
    guard let files = try? fm.contentsOfDirectory(at: dirURL, includingPropertiesForKeys: nil) else { return [] }
    var executables = [String]()
    
    for file in files {
        //dir is also special executable
        guard file.hasDirectoryPath == false else { continue }
        if fm.isExecutableFile(atPath: file.path) {
            executables.append(file.lastPathComponent)
        }
    }
    return executables
}

/*
 Write a function that accepts a path to a directory, then converts to PNGs any JPEGs it finds in there, leaving the originals intact. If any JPEG can’t be converted the function should just quietly continue.
 */
func challenge35(in directory: String) {
    
}
